require './lib/board'
require './lib/cell'
require './lib/ship'
require 'rspec'

describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end

  it 'has cells on the board' do
    expect(@board.cells).to be_a_kind_of(Hash)
  end

  it 'has sixteen key-value pairs' do
    expect(@board.cells.size).to eq(16)
  end

  it 'has valid coordinates' do
    expect(@board.valid_coordinate?('A1')).to eq(true)
    expect(@board.valid_coordinate?('B4')).to eq(true)
    expect(@board.valid_coordinate?('C4')).to eq(true)
  end

  it 'if provided invalid coordinate, returns false' do
    expect(@board.valid_coordinate?('A5')).to eq(false)
    expect(@board.valid_coordinate?('B5')).to eq(false)
    expect(@board.valid_coordinate?('C5')).to eq(false)
  end

  it 'valid_placement? returns false if incorrect ship length placed' do
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'valid_placement? returns true if correct ship length placed' do
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(@board.valid_placement?(cruiser, ["A2", "A3", "A4"])).to eq(true)
    expect(@board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
  end

  it 'valid_placement? returns false if placement is incorrect' do
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'valid_placement? returns true if placement is correct' do
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(cruiser, ["C1", "C2", "C3"])).to eq(true)
    expect(@board.valid_placement?(submarine, ["B1", "B2"])).to eq(true)
  end

  it 'valid_placement? returns false if placement is diagonal' do
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

end
