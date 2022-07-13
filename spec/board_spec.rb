require './lib/board'
require './lib/cell'
#require 'rspec'

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

    #board_size = board.size
    expect(board.cells.size).to eq(16)
  end

  it 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?('A1')).to eq(true)
  end


end
