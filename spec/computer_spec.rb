require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
require 'rspec'

RSpec.describe Computer do
    before(:each) do
      @computer = Computer.new
    end

    it 'exists' do
      expect(@computer).to be_an_instance_of(Computer)
    end

    # it 'can place ships' do
    #
    #
    #
    #   expect(@computer.place_ships).to eq()
    # end
    #
    # it 'can move' do
    #   expect(@computer.move).to eq()
    # end
end
