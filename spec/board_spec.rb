require './lib/board'
require 'rspec'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it 'has cells on the board' do
    board = Board.new

    expect(board.cells).to eq({})
  end
end
