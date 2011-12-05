
module Navigation

  ARRIVE_DIRECTIONS = { "north" => "the south",
                        "south" => "the north",
                        "east" => "the west",
                        "west" => "the east",
                        "up" => "below",
                        "down" => "above"
  }

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
      player.send_text << "You move #{exitAlias}"
      player.location.contents.each do |i|
        if i.class == Player && i != player
          i.send_text << "#{player.name} leaves #{exitAlias}"
        end
      end
      raw_move(player, theExit.toRoom)
      player.location.contents.each do |i|
        if i.class == Player && i != player
          i.send_text << "#{player.name} arrives from #{ARRIVE_DIRECTIONS[exitAlias]}"
        end
      end
      return true
    else
      player.send_text << "You can't move #{exitAlias}"
      return false
    end
  end
end
