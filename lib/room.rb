
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

end
