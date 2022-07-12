require './lib/ship'
require './lib/cell'
require 'rspec'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new('B4')

    expect(cell).to be_an_instance_of(Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new('B4')

    expect(cell.coordinate).to eq('B4')
  end

  it 'does not have a ship by default' do
    cell = Cell.new('B4')

    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  it 'can have the ship placed in it' do
    cell = Cell.new('B4')
    ship = Ship.new('cruiser', 3)

    cell.place_ship(ship)
    expect(cell.ship).to eq(ship)
    expect(cell.empty?).to eq(false)
  end

  it 'is fired upon' do
    cell = Cell.new('B4')
    ship = Ship.new('cruiser', 3)

    cell.place_ship(ship)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

end
