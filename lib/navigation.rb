
module Navigation

  def self.raw_move(player, room)
    raise ArgumentError unless player or room
    if player.location
      player.location.contents.delete(player)
    end

    player.location = room
    room.contents.push player

    true
  end

  def self.move player, exitAlias
    puts exitAlias

    theExit = player.location.exits.find { |i|
      i.alias == exitAlias
    }

    theExit ? raw_move(player, theExit.toRoom) : false

  end

end
