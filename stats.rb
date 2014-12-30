#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'json'
require 'descriptive_statistics'

def server
  context = ZMQ::Context.new
  server = context.socket ZMQ::REP
  server.bind 'tcp://*:5554'

  loop do
    request = ''
    server.recv_string request
    request = JSON.parse request

    roll = "#{ request['dice'] }d#{ request['sides'] }"

    $history[roll] = [] unless $history.include? roll

    payload = {
      request: request,
      response: $history[roll].descriptive_statistics
    }
    response = JSON.generate payload
    server.send_string response
    puts "#{ response }"
  end
end

def subscribe(topic: '')
  context = ZMQ::Context.new
  subscriber = context.socket ZMQ::SUB
  subscriber.connect 'tcp://localhost:5556'
  subscriber.setsockopt ZMQ::SUBSCRIBE, topic

  puts 'Tracking roll stats...'

  loop do
    response = ''
    subscriber.recv_string response
    _topic, response = response.split(/^\w+\s/)
    response = JSON.parse response

    roll = "#{ response['request']['dice'] }d#{ response['request']['sides'] }"

    $history[roll] = [] unless $history.include? roll
    $history[roll] << response['response'].sum
    puts "#{ roll } stats are #{ $history[roll].descriptive_statistics }"
  end
end

$history = {}

threads = []
threads << Thread.new { subscribe }
threads << Thread.new { server }
threads.each(&:join)
