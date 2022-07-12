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

    cell.place_ship
    expect(cell.ship).to eq(@ship)
    expect(cell.empty?).to eq(false)
  end
end
