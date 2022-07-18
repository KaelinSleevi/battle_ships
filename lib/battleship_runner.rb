require './lib/board'
require './lib/cell'
require './lib/ship'
require 'rspec'


def start
  cruiser = Ship.new('cruiser', 3)
  submarine = Ship.new('Submarine', 2)

  puts "Welcome to BATTLESHIP"
  puts "-----------------------"
  puts "Enter p to play. Enter q to quit"
  #input = (gets.chomp).downcase
  if (gets.chomp).downcase == "p"
    puts "Welcome! Let's start the game."
    puts "I have laid out my ships on the grid."
    computer = Board.new
    computer.place(cruiser, %w[B1 B2 B3])
    computer.place(submarine, %w[C1 D1])
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    player_1 = Board.new
    print player_1.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts "DO NOT place commas in between coordinates, only spaces."
    input = gets.chomp
    player_1.place(cruiser, (input.split(" ")))
    print player_1.render(true)
    puts "Enter the squares for the Submarine (2 spaces):"
    while input = gets.chomp
    player_1.place(submarine, (input.split(" ")))
    print player_1.render(true)

  end
end

start
