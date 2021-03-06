#!/usr/bin/env ruby

require 'commander'
require 'ffi-rzmq'
require 'json'

module Commander
  class Command
    # Adding a few methods to coerce Options into more usable types.
    class Options
      def to_a
        inspect.tap { |s| s.slice! 'Commander::Command::Options' }.split(/\W/).reject!(&:empty?)
      end

      def to_h
        Hash[*to_a]
      end

      def to_s
        to_h.to_s
      end
    end
  end
end

def remote_roll(request: '')
  context = ZMQ::Context.new
  client = context.socket ZMQ::REQ
  client.connect "tcp://localhost:#{ request['port'] }"

  client.send_string JSON.generate request
  response = ''

  client.recv_string response
  JSON.parse response
end

Commander.configure do
  program :name, 'roll-client'
  program :version, '0.7.1'
  program :description, 'It rolls dice, somewhere else.'

  default_command :roll

  command :roll do |command|
    command.syntax = 'roll <dice> <sides>'
    command.option '--dice N', Integer
    command.option '--sides N', Integer
    command.option '--topic STRING', String
    command.option '--port N', Integer

    command.action do |_arguments, options|
      options.dice ||= ask('How many dice would you like to roll?', Integer)
      options.sides ||= ask('How many sides per die?', Integer)
      options.default topic: 'default', port: 5555

      request = options.to_h
      puts "Request sent for #{ request }"

      response = remote_roll request: request
      puts "Received response of #{ response['response'] }"
    end
  end
end
