class Game
    def initialize
        @cruiser = Ship.new('cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
        @ships = [@cruiser, @submarine]
        @computer = []
        @player_1_board = []
        @shots_taken_computer = []
        @shots_taken_player = []
    end

    def introduction
        puts "Welcome to BATTLESHIP"
        puts "-----------------------"
        puts "Enter p to play. Enter q to quit"
        quit_game(gets.chomp.downcase)
    end

    def quit_game(input)
        if input == 'q'
            puts "You have quit the game"
        elsif input != 'p'
            puts "Incorrect input, please try again"
            puts "Enter p to play. Enter q to quit"
            quit_game(gets.chomp.downcase)
        else
            start
        end
    end

    def start
        puts "Welcome! Let's start the game."
        computer_place_ships
        render_boards
        player_shot
    end

    def render_boards
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

    def player_shot
      puts "Enter the coordinate for your shot:"
      input = gets.chomp.upcase
      while !@player_1_board.valid_coordinate?(input) || @shots_taken_player.include?(input)
        puts "Invalid coordinates. Please enter a valid coordinate:"
        input = gets.chomp.upcase
      end

      @shots_taken_player.push(input)

      @computer.board.cells[input].fire_upon
      if @computer.board.cells[input].render == "M"
        puts "Your shot on #{input} was a miss."
      elsif @computer.board.cells[input].render == "H"
        puts "Your shot on #{input} was a hit."
      elsif @computer.board.cells[input].render == "X"
        puts "Your shot on #{input} sunk the ship."
      end
      computer_shot
    end

    def end_game?
      player_1_ships =  @player_1_board.cells.keys.find_all { |key| @player_1_board.cells[key].empty? == false}
      computer_ships =  @computer.board.cells.keys.find_all { |key| @computer.board.cells[key].empty? == false}

      if @player_1_board.cells[player_1_ships.shift].ship.sunk? && @player_1_board.cells[player_1_ships.last].ship.sunk?
        puts "I won!"
        return true
      elsif @computer.board.cells[computer_ships.shift].ship.sunk? && @computer.board.cells[computer_ships.last].ship.sunk?
        puts "You won!"
        return true
      end
      false
    end

    def computer_shot
      input = @player_1_board.cells.keys.sample

      while @shots_taken_computer.include?(input)
        input = @player_1_board.cells.keys.sample
      end
      @shots_taken_computer.push(input)

      @player_1_board.cells[input].fire_upon
      if @player_1_board.cells[input].render == "M"
        puts "Your ship at #{input} was missed"
      elsif @player_1_board.cells[input].render == "H"
        puts "You have been hit at #{input}"
      elsif @player_1_board.cells[input].render == "X"
        puts "Your ship at #{input} has sunk"
      end
      if end_game? == true
        quit_game("q")
      else
        render_boards
        player_shot
      end
    end
  end
