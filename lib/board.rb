require 'pry'
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
    consec_num = ("1".."4")
    #consec_letter = ("A".."D").to_a
    #letter_arr = coordinates.map {|coordinate| coordinate.slice(0)}
    #num_arr = coordinates.map {|coordinate| coordinate.slice(1..2).to_i}
    consec_num.include?(coordinates)

    #horizontal_placement?(coordinates.map { |cell| cell[0] })
  end

  def vertical_placement?(coordinates)
    #consec_num = (1..4).to_a
    consec_letter = ("A".."D")
    #letter_arr = coordinates.map {|coordinate| coordinate.slice(0)}
    #num_arr = coordinates.map {|coordinate| coordinate.slice(1..2).to_i}

    consec_letter.include?(coordinates)
    #vertical_placement?(coordinates.map { |cell| cell[0] })
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length
      if vertical_placement?(coordinates)
        vertical_placement(coordinates.map { |cell| cell[0] }) && coordinates.map { |cell| cell[1]  }.uniq.count == 1
        true
      elsif horizontal_placement?(coordinates)
        horizontal_placement(coordinates.map { |cell| cell[1] }) && coordinates.map { |cell| cell[0]  }.uniq.count == 1
        true
      else
        false
      end
    else
      false
    end
  end
end
