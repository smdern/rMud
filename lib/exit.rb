
class Exit

  attr_accessor(:alias, :toRoom)

  def initialize args
    @alias = args[:alias] or raise ArgumentError
    @toRoom = args[:toRoom] or raise ArgumentError
  end

end
