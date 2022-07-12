class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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
    if @ship
      @ship.health == @ship.hit
    else
      return true
    end
  end

  def fired_upon?
    if @ship
      @ship.health < @ship.length
    else
      false
    end
  end

  def render(reveal = false)
    if fired_upon? == false && @ship == nil
      return '.'
    else fire_upon == true && @ship == nil
      return 'M'
    end
  end
end
