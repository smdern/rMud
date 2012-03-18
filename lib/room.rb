
class Room

  attr_accessor :exits, :contents
  attr_reader :title, :short_description, :long_description

  def initialize args
    @title = args[:title]
    @long_description = args[:long_description]
    @short_description = args[:short_description]
    @exits = []
    @contents = []
  end

  def exits
    @exits.sort! { |lhs, rhs| exitSort(lhs, rhs) }
  end

  private

  def exitSort (lhs, rhs)

    cardinalDirections = ["north", "south", "east", "west", "up", "down"]

    if (cardinalDirections.include?(lhs.alias) && cardinalDirections.include?(rhs.alias))
      cardinalDirections.index(lhs.alias) <=> cardinalDirections.index(rhs.alias)
    elsif cardinalDirections.include?(lhs.alias)
      -1
    elsif cardinalDirections.include?(rhs.alias)
      1
    else
      lhs.alias <=> rhs.alias
    end

  end

end
