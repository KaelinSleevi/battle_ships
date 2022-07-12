require './lib/ship'
require 'rspec'

RSpec.describe Ship do

  it 'exists' do
    ship = Ship.new('cruiser', 3)

    expect(ship).to be_an_instance_of(Ship)
  end

  it 'has a name' do
    ship = Ship.new('cruiser', 3)

    expect(ship.name).to eq('cruiser')
  end

  it 'has a length' do
    ship = Ship.new('cruiser', 3)

    expect(ship.length).to eq(3)
  end

  it 'has health' do
    ship = Ship.new('cruiser', 3)

    expect(ship.health).to eq(3)
  end

  it 'is not sunk by default' do
    ship = Ship.new('cruiser', 3)

    expect(ship.sunk?).to eq(false)
  end

  it 'can get hit' do
    ship = Ship.new('cruiser', 3)

    ship.hit
    expect(ship.health).to eq(2)
    ship.hit
    expect(ship.health).to eq(1)
    expect(ship.sunk?).to eq(false)
  end

  it 'has sunk' do
    ship = Ship.new('cruiser', 3)

    ship.hit
    ship.hit
    ship.hit
    expect(ship.health).to eq(0)
    expect(ship.sunk?).to eq(true)
  end
end
