#!/usr/bin/env ruby

require 'commander'

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

Commander.configure do
  program :name, 'roll'
  program :version, '0.2.5'
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
end
