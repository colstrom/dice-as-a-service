#!/usr/bin/env ruby

require 'commander'
require 'ffi-rzmq'

def remote_roll(request: '')
  context = ZMQ::Context.new
  client = context.socket ZMQ::REQ
  client.connect 'tcp://localhost:5555'

  client.send_string request
  response = ''
  client.recv_string response
  response
end

def serialize(**options)
  "#{ options[:topic] },#{ options[:dice] },#{ options[:sides] }"
end

Commander.configure do
  program :name, 'roll-client'
  program :version, '0.4.3'
  program :description, 'It rolls dice, somewhere else.'

  default_command :roll

  command :roll do |command|
    command.syntax = 'roll <dice> <sides>'
    command.option '--dice N', Integer
    command.option '--sides N', Integer
    command.option '--topic STRING', String

    command.action do |_arguments, options|
      options.dice ||= ask('How many dice would you like to roll?', Integer)
      options.sides ||= ask('How many sides per die?', Integer)
      options.default topic: 'default'

      request = serialize dice: options.dice, sides: options.sides, topic: options.topic
      puts "Request sent for #{ request }"

      response = remote_roll request: request
      puts "Received response of #{ response }"
    end
  end
end
