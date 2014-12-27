#!/usr/bin/env ruby

require 'ffi-rzmq'

context = ZMQ::Context.new
client = context.socket ZMQ::REQ
client.connect 'tcp://localhost:5555'

client.send_string ''
response = ''
client.recv_string response

puts response
