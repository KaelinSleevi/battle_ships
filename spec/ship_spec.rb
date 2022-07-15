require './lib/ship'
require './lib/board'
require './lib/cell'
require 'rspec'

RSpec.describe Ship do
  before(:each) do
    @ship = Ship.new('cruiser', 3)
  end

  it 'exists' do
    expect(@ship).to be_an_instance_of(Ship)
  end

  it 'has a name' do
    expect(@ship.name).to eq('cruiser')
  end

  it 'has a length' do
    expect(@ship.length).to eq(3)
  end

  it 'has health' do
    expect(@ship.health).to eq(3)
  end

  it 'is not sunk by default' do
    expect(@ship.sunk?).to eq(false)
  end

  it 'can get hit' do
    @ship.hit
    expect(@ship.health).to eq(2)
    @ship.hit
    expect(@ship.health).to eq(1)
    expect(@ship.sunk?).to eq(false)
  end

  it 'has sunk' do
    @ship.hit
    @ship.hit
    @ship.hit
    expect(@ship.health).to eq(0)
    expect(@ship.sunk?).to eq(true)
  end
end
