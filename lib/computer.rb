class Computer
    attr_accessor :board

    def initialize
        @board = Board.new
        @cruiser = Ship.new('cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
        @ships = [@cruiser, @submarine]
    end

    def place_ships
        @ships.each do |ship|
            placement = false
            while !placement
                current_move = move(ship.length)
                if @board.place(ship, current_move)
                    placement = true
                end
            end
        end
    end

    def move(length)
        if length == 3
            filename = './lib/three_length_placements.txt'
        elsif length == 2
            filename = './lib/two_length_placements.txt'
        end

        placements = []
        file_data = File.readlines(filename).map(&:chomp)
        file_data.map { |line| placements << line.split(',') }
        placements.sample
    end
end
