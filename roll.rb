#!/usr/bin/env ruby

require 'commander/import'

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

program :name, 'roll'
program :version, '0.2.3'
program :description, 'It rolls dice.'

default_command :roll

command :roll do |command|
  command.syntax = 'roll <dice> <sides>'

  dice = ARGV[0] || ask('How many dice would you like to roll?', Integer)
  sides = ARGV[1] || ask('How many sides per die?', Integer)

  puts roll dice: dice.to_i, sides: sides.to_i
end
