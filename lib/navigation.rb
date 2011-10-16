
module Navigation

  def self.raw_move(player, room)
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
      puts i.alias

      i.alias == exitAlias
    }
    
    puts theExit ? theExit : "nil" 
    
    theExit ? raw_move(:player, theExit.toRoom) : false

  end

end
