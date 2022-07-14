require './lib/board'
require './lib/cell'
require './lib/ship'
require 'rspec'

describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it 'has cells on the board' do
    board = Board.new

    expect(board.cells).to be_a_kind_of(Hash)
  end

  it 'has sixteen key-value pairs' do
    board = Board.new

    expect(board.cells.size).to eq(16)
  end

  it 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?('A1')).to eq(true)
    expect(board.valid_coordinate?('B4')).to eq(true)
    expect(board.valid_coordinate?('C4')).to eq(true)
  end

  it 'if provided invalid coordinate, returns false' do
    board = Board.new

    expect(board.valid_coordinate?('A5')).to eq(false)
    expect(board.valid_coordinate?('B5')).to eq(false)
    expect(board.valid_coordinate?('C5')).to eq(false)
  end

  it 'valid_placement? returns false if incorrect ship length placed' do
    board = Board.new

    cruiser = Ship.new("Crusier", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(crusier, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'valid_placement? returns true if correct ship length placed' do
    board = Board.new

    cruiser = Ship.new("Crusier", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(crusier, ["A2", "A3", "A4"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
  end

end
