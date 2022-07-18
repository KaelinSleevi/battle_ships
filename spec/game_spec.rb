require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
require 'rspec'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
  end

  it 'exists' do
    expect(@cell).to be_an_instance_of(Cell)
  end
end
