
class Exit

  attr_accessor(:alias, :toRoom)

  def initialize *args
    #This is broken!
    @alias = :alias
    @toRoom = :toRoom
  end

end
