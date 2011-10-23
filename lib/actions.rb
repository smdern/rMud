
module Actions

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
end
