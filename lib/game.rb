class Game
    def initialize
        @cruiser = Ship.new('cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
        @ships = [@cruiser, @submarine]
        @computer = []
        @player_1_board = []
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
        puts '=============COMPUTER BOARD============='
        print @computer.board.render
        puts '==============PLAYER BOARD=============='
        print @player_1_board.render(true)
    end

    def computer_place_ships
        @computer = Computer.new
        @computer.place_ships
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        player_place_ships
    end

    def player_place_ships
        @player_1_board = Board.new
        print @player_1_board.render

        @ships.each do |ship|
            puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
            puts "DO NOT place commas in between coordinates, only spaces."
            input = gets.chomp
            while @player_1_board.place(ship, (input.upcase.split(" "))) != true
                puts "Those are invalid coordinates. Please try again:"
                input = gets.chomp
            end
            print @player_1_board.render(true)
        end
    end
end
