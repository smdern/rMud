
class Player

  attr_accessor :location, :send_text
  attr_reader :name, :description

  def initialize(name, args)
    @location = nil
    @send_text = []
    @name = name
    @description = args[:description]
  end

end
