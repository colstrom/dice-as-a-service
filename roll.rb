#!/usr/bin/env ruby

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

puts roll
