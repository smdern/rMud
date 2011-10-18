
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
    theExit = player.location.exits.find { |i|
      i.alias == exitAlias
    }

    if theExit
      raw_move(player, theExit.toRoom)
      player.send_text << "You move #{exitAlias}"
      return true
    else
      player.send_text << "You can't move #{exitAlias}"
      return false
    end

  end

end
