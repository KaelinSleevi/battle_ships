class Board
  attr_reader :cells

  def initialize()
    @cells = {
      "A1" => Cell.new('A1'),
      "A2" => Cell.new('A2'),
      "A3" => Cell.new('A3'),
      "A4" => Cell.new('A4'),
      "B1" => Cell.new('B1'),
      "B2" => Cell.new('B2'),
      "B3" => Cell.new('B3'),
      "B4" => Cell.new('B4'),
      "C1" => Cell.new('C1'),
      "C2" => Cell.new('C2'),
      "C3" => Cell.new('C3'),
      "C4" => Cell.new('C4'),
      "D1" => Cell.new('D1'),
      "D2" => Cell.new('D2'),
      "D3" => Cell.new('D3'),
      "D4" => Cell.new('D4')
    }
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def horizontal_placement?(coordinates)
    letter_arr = coordinates.map {|coordinate| coordinate.slice(0)}
    num_arr = coordinates.map {|coordinate| coordinate.slice(1..2).to_i}
    (letter_arr.uniq.count == 1 && (num_arr.min..num_arr.max).to_a == num_arr)
  end

  def vertical_placement?(ship, coordinates)
    letter_arr = coordinates.map {|coordinate| coordinate.slice(0)}
    num_arr = coordinates.map {|coordinate| coordinate.slice(1..2).to_i}
    (num_arr.all?(num_arr[0]) && (letter_arr[0].ord + (ship.length - 1)) == letter_arr.last.ord)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.any?{|coordinate| @cells[coordinate].empty? == false}
      if vertical_placement?(ship, coordinates) && ship.length == coordinates.length
        true
      elsif horizontal_placement?(coordinates) && ship.length == coordinates.length
        true
      else
        false
      end
    end


  def place(ship, coordinates)
    if coordinates.map { |coordinate| valid_coordinate?(coordinate)  } && valid_placement?(ship, coordinates)
      coordinates.map { |coordinate|  @cells[coordinate].place_ship(ship) }
      true
    else
      false
    end
  end


  def render(reveal = true)
    if reveal == true
      board_letters = @cells.keys.map {|key| key.slice(0)}.uniq.slice(1..3)
      render_arr = @cells.keys.map {|key| @cells[key].render(true)}

      placement_counter = 0
      counter = 0
      
      render_str = "  1 2 3 4 \nA "
      render_arr.each do |render|
        render_str = render_str + render.to_s + " "
        counter += 1
        if counter == 4
          render_str = render_str + ("\n#{board_letters[placement_counter]} ")
          placement_counter += 1
          counter = 0
        end
      end
    else
      board_letters = @cells.keys.map {|key| key.slice(0)}.uniq.slice(1..3)
      render_arr = @cells.keys.map {|key| @cells[key].render}

      placement_counter = 0
      counter = 0
      
      render_str = "  1 2 3 4 \nA "
      render_arr.each do |render|
        render_str = render_str + render.to_s + " "
        counter += 1
        if counter == 4
          render_str = render_str + ("\n#{board_letters[placement_counter]} ")
          placement_counter += 1
          counter = 0
        end
      end
    end
  end
end