#!/usr/bin/env ruby

require 'highline/import'

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

dice = ARGV[0] || ask('How many dice would you like to roll?', Integer)
sides = ARGV[1] || ask('How many sides per die?', Integer)

puts roll dice: dice.to_i, sides: sides.to_i
