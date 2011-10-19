
class Player

  attr_accessor(:location, :send_text)
  attr_reader(:name, :long_description, :short_description)

  def initialize args
    @location = nil
    @send_text = []
    @name = args[:name]
    @description = args[:description]
  end

end
