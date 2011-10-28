module Actions

  DISTANCES = [
    "right here",
    "immediately to the",
    "nearby to the",
    "a ways to the",
    "a ways to the",
    "far to the"
  ]

  def self.look player, args = nil
    unless args
      player.send_text << player.location.title
      player.send_text << player.location.long_description
      player.send_text << "Exits: " + player.location.exits.map {|exit| exit.alias.capitalize}.join(", ")
      player.location.contents.each do |i|
        player.send_text << i.name unless i == player
      end
      return
    end
  end

  def self.exits player
    player.send_text << "Obvious exits:"
    player.location.exits.each do |exit|
      player.send_text << "%-5s - %s" % [exit.alias.capitalize, exit.toRoom.title]
    end
  end

  def self.say player, args
    player.send_text << "You say '#{args}'"
    player.location.contents.each do |i|
      if i.class == Player
        i.send_text << "#{player.name} says '#{args}'"
      end
    end
  end

  def self.scan player
    player.send_text << "You peer intently all around, and see :"

    player.location.contents.each do |c|
      player.send_text << "%+30s : %s" % [c.name, DISTANCES[0] ] unless c == player
    end

    player.location.exits.each do |exit|
      room = player.location
      (1..5).each do |distance|
        idx = room.exits.index {|e| e.alias == exit.alias }
        return unless idx
        room = room.exits[idx].toRoom

        room.contents.each do |c|
          player.send_text << "%+30s : %s #{exit.alias}" % [c.name, DISTANCES[distance] ] unless distance == 0 && c == player
        end
      end
    end
  end
end
