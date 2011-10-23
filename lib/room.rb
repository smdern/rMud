
class Room

  attr_accessor(:exits, :contents)
  attr_reader(:title, :short_description, :long_description)

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

      cardinalDirections = ["north", "south", "east", "west"]

      if (cardinalDirections.contains(lhs) && cardinalDirections.contains(rhs))
        cardinalDirections.index_of(lhs).compare(cardinalDirections.index_of(rhs))
      elsif cardinalDirections.contains(lhs)
        -1
      elsif cardinalDirections.contains(rhs)
        1
      else
        lhs.compare rhs
      end

    end

end
