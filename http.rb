#!/usr/bin/env ruby

require 'ffi-rzmq'
require 'json'
require 'sinatra'

def call_service(request: '', port: 5555)
  context = ZMQ::Context.new
  client = context.socket ZMQ::REQ
  client.connect "tcp://localhost:#{ port }"

  client.send_string JSON.generate request
  response = ''

  client.recv_string response

  http_response = JSON.parse response
  JSON.generate http_response['response']
end

get '/roll/:dice/:sides' do
  params['topic'] = 'http'
  call_service request: params, port: 5555
end

get '/stats/:dice/:sides' do
  params['topic'] = 'http'
  call_service request: params, port: 5554
end
