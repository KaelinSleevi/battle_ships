class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired = false
  end

  def empty?
    if @ship == nil
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
    if @ship
      @ship.health == @ship.hit
    end
  end

  def fired_upon?
    return @fired
  end

  def render(reveal = false)
    if fired_upon? == false && @ship == nil
      return '.'
    elsif fired_upon? == true && @ship == nil
      return 'M'
    elsif @ship.sunk? == true && @ship
      return 'X'
    elsif fired_upon? == true && @ship
      return 'H'
    elsif @ship && reveal == true
      return 'S'
    else
      return '.'
    end
  end
end
