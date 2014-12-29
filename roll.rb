#!/usr/bin/env ruby

require 'commander'
require 'ffi-rzmq'

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

def server(protocol: 'tcp', address: '*', port: 5555, provides: -> {})
  context = ZMQ::Context.new
  server = context.socket ZMQ::REP
  server.bind "#{ protocol }://#{ address }:#{ port }"
  publisher = context.socket ZMQ::PUB
  publisher.bind "#{ protocol }://#{ address }:#{ port + 1 }"

  puts "Dice Service listening on #{ protocol } #{ port }"
  loop do
    request = ''
    server.recv_string request

    response = provides.call(request).to_s
    server.send_string response

    topic = deserialize(request).first
    publisher.send_string "#{ topic } #{ response }"

    puts "#{ request } #{ response }"
  end
end

def deserialize(request)
  request = request.split(/,/)
  [request.shift, request.map(&:to_i)].flatten
end

Commander.configure do
  program :name, 'roll'
  program :version, '0.4.2'
  program :description, 'It rolls dice.'

  default_command :roll

  command :roll do |command|
    command.syntax = 'roll <dice> <sides>'
    command.option '--dice N', Integer
    command.option '--sides N', Integer

    command.action do |_arguments, options|
      options.dice ||= ask('How many dice would you like to roll?', Integer)
      options.sides ||= ask('How many sides per die?', Integer)

      puts roll dice: options.dice, sides: options.sides
    end
  end

  command :service do |command|
    command.action do
      service = lambda do |request|
        _topic, dice, sides = deserialize request
        roll(dice: dice, sides: sides)
      end
      server provides: service
    end
  end
end
