#!/usr/bin/env ruby

def roll(dice: 1, sides: 6)
  dice.times.map { rand 1..sides }
end

puts 'How many dice would you like to roll?'
dice = gets.to_i

puts roll dice: dice
