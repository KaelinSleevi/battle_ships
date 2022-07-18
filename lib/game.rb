class Game
    def initialize
        @cruiser = Ship.new('cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
        @ships = [@cruiser, @submarine]
    end

    def introduction
        puts "Welcome to BATTLESHIP"
        puts "-----------------------"
        puts "Enter p to play. Enter q to quit"
        end_game(gets.chomp.downcase)
    end

    def end_game(input)
        if input == 'q'
            puts "You have quit the game"
        elsif input != 'p'
            puts "Incorrect input, please try again"
            puts "Enter p to play. Enter q to quit"
            end_game(gets.chomp.downcase)
        else
            start
        end
    end

    def start
        puts "Welcome! Let's start the game."
        computer_place_ships
    end

    def computer_place_ships
        # logic to place computer ships
        computer = Board.new
        computer.place(@cruiser, %w[B1 B2 B3]) # needs to be random
        computer.place(@submarine, %w[C1 D1])
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        player_place_ships
    end

    def player_place_ships
        player_1 = Board.new
        print player_1.render

        @ships.each do |ship|
            puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
            puts "DO NOT place commas in between coordinates, only spaces."
            input = gets.chomp
            while player_1.place(ship, (input.upcase.split(" "))) != true
                puts "Those are invalid coordinates. Please try again:"
                input = gets.chomp
            end
            print player_1.render(true)
        end
    end
end