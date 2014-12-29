#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'json'
require 'descriptive_statistics'

def subscribe(topic: '')
  context = ZMQ::Context.new
  subscriber = context.socket ZMQ::SUB
  subscriber.connect 'tcp://localhost:5556'
  subscriber.setsockopt ZMQ::SUBSCRIBE, topic

  puts 'Tracking roll stats...'

  history = {}

  loop do
    response = ''
    subscriber.recv_string response
    _topic, response = response.split(/^\w+\s/)
    response = JSON.parse response

    roll = "#{ response['request']['dice'] }d#{ response['request']['sides'] }"

    history[roll] = [] unless history.include? roll
    history[roll] << response['response'].sum
    puts "#{ roll } stats are #{ history[roll].descriptive_statistics }"
  end
end

subscribe
