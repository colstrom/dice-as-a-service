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

  puts "Dice Service listening on #{ protocol } #{ port }"
  loop do
    request = ''
    server.recv_string request
    server.send_string provides.call.to_s
  end
end

Commander.configure do
  program :name, 'roll'
  program :version, '0.3.1'
  program :description, 'It rolls dice.'

  default_command :roll

  command :roll do |command|
    command.syntax = 'roll <dice> <sides>'
    command.option '--dice N', Integer
    command.option '--sides N', Integer
    command.option '--service'

    command.action do |_arguments, options|
      options.dice ||= ask('How many dice would you like to roll?', Integer)
      options.sides ||= ask('How many sides per die?', Integer)

      if options.service
        service = -> { roll(dice: options.dice, sides: options.sides) }
        server provides: service
      else
        puts roll dice: options.dice, sides: options.sides
      end
    end
  end
end
