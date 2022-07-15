class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired = false
  end

  def empty?
    if @ship.nil?
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired = true
    @ship.health == @ship.hit if @ship
  end

  def fired_upon?
    @fired
  end

  def render(reveal = false)
    if !fired_upon? && @ship.nil?
      '.'
    elsif fired_upon? && @ship.nil?
      'M'
    elsif @ship.sunk? && @ship
      'X'
    elsif fired_upon? && @ship
      'H'
    elsif @ship && reveal == true
      'S'
    else
      '.'
    end
  end
end
