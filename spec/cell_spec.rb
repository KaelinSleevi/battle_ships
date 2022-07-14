require './lib/ship'
require './lib/cell'
require 'rspec'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
  end

  it 'exists' do
    expect(@cell).to be_an_instance_of(Cell)
  end

  it 'has a coordinate' do
    expect(@cell.coordinate).to eq('B4')
  end

  it 'does not have a ship by default' do
    expect(@cell.ship).to eq(nil)
    expect(@cell.empty?).to eq(true)
  end

  it 'can have the ship placed in it' do
    ship = Ship.new('cruiser', 3)

    @cell.place_ship(ship)
    expect(@cell.ship).to eq(ship)
    expect(@cell.empty?).to eq(false)
  end

  it 'is fired upon' do
    ship = Ship.new('cruiser', 3)

    @cell.place_ship(ship)
    expect(@cell.fired_upon?).to eq(false)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end

  before(:each) do
    @cell_1 = Cell.new('B4')
  end

  it 'can render if @cell_1 has not been fired upon' do
    expect(@cell_1.render).to eq('.')

    @cell_1.fire_upon

    expect(@cell_1.render).to eq('M')
  end

  before(:each) do
    @cell_2 = Cell.new('C3')
  end

  it 'can render if @cell_2 has not been fired upon' do
    ship = Ship.new('cruiser', 3)
    @cell_2.place_ship(ship)

    expect(@cell_2.render).to eq('.')

    expect(@cell_2.render(true)).to eq('S')
  end

  it 'can render if @cell_2 has been fired upon' do
    ship = Ship.new('cruiser', 3)
    @cell_2.place_ship(ship)

    @cell_2.fire_upon

    expect(@cell_2.render).to eq('H')
  end

  it 'can render if @cell_2 has been sunk' do
    ship = Ship.new('cruiser', 3)
    @cell_2.place_ship(ship)

    @cell_2.fire_upon
    @cell_2.fire_upon

    expect(ship.sunk?).to eq(false)

    @cell_2.fire_upon

    expect(ship.sunk?).to eq(true)

    expect(@cell_2.render).to eq('X')
  end
end