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
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 A2])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[A2 A3 A4])).to eq(false)
  end

  it 'valid_placement? returns true if correct ship length placed' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A2 A3 A4])).to eq(true)
    expect(@board.valid_placement?(submarine, %w[A2 A3])).to eq(true)
  end

  it 'valid_placement? returns false if placement is incorrect (horizontal)' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 A2 A4])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[C1 C4])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A3 A2 A1])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[B1 B3])).to eq(false)
  end

  it 'valid_placement? returns true if placement is correct (horizontal)' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 A2 A3])).to eq(true)
    expect(@board.valid_placement?(submarine, %w[A1 A2])).to eq(true)
    expect(@board.valid_placement?(cruiser, %w[C1 C2 C3])).to eq(true)
    expect(@board.valid_placement?(submarine, %w[B1 B2])).to eq(true)
  end

  it 'valid_placement? returns false if placement is incorrect (vertical)' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 B1 D1])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[A2 C2])).to eq(false)
  end

  it 'valid_placement? returns true if placement is correct (vertical)' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 B1 C1])).to eq(true)
    expect(@board.valid_placement?(submarine, %w[C1 D1])).to eq(true)
  end

  it 'valid_placement? returns false if placement is diagonal' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1 B2 C3])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[C2 D3])).to eq(false)
  end

  it ' expects place ship on the board to be true' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.place(cruiser, %w[A1 A2 A3])).to eq(true)
    expect(@board.place(submarine, %w[C2 D2])).to eq(true)
  end
  it ' expects place ship on the board to be false' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.place(cruiser, %w[A1 A2 A4])).to eq(false)
    expect(@board.place(submarine, %w[C2 D1])).to eq(false)
  end

  it 'cells have the right ship in them' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    @board.place(cruiser, %w[A1 A2 A3])
    cell_1 = @board.cells['A1']
    cell_2 = @board.cells['A2']
    cell_3 = @board.cells['A3']

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
  end

  it 'can ensure ships do not overlap' do
    cruiser = Ship.new('cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    @board.place(cruiser, %w[A1 A2 A3])
    cell_1 = @board.cells['A1']
    cell_2 = @board.cells['A2']
    cell_3 = @board.cells['A3']

    expect(@board.valid_placement?(submarine, %w[A1 B1])).to eq(false)
  end

  it 'renders board' do
    cruiser = Ship.new('cruiser', 3)
    @board.place(cruiser, %w[A1 A2 A3])

    expect(@board.render.strip).to eq("1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . .")

    expect(@board.render(true).strip).to eq("1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . .")
  end
end
