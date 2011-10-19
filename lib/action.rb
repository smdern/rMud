
module Action

  def self.look player, args = nil
    unless args
      player.send_text << player.location.title
      player.send_text << player.location.long_description
      # need helper for getting exits
      player.location.contents.each do |i|
        player.send_text << i.name unless i == player
      end
      return
    end
  end
end
