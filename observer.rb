#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'json'

def subscribe(topic: '')
  context = ZMQ::Context.new
  subscriber = context.socket ZMQ::SUB
  subscriber.connect 'tcp://localhost:5556'
  subscriber.setsockopt ZMQ::SUBSCRIBE, topic

  puts 'Silently creeping your rolls.'

  loop do
    response = ''
    subscriber.recv_string response
    _topic, response = response.split(/^\w+\s/)
    puts response
  end
end

subscribe
