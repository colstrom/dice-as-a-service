#!/usr/bin/env ruby

require 'highline/import'

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

dice = ask 'How many dice would you like to roll?', Integer
sides = ask 'How many sides per die?', Integer

puts roll dice: dice, sides: sides
