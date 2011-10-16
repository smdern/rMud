
require 'exit'
require 'room'
require 'player'
require 'navigation'

describe Navigation do
  let (:player) { Player.new }
  let (:northRoom) { Room.new }
  let (:startingRoom) { Room.new }

  before do 
    Navigation.raw_move(player, startingRoom)

    startingRoom.exits.push Exit.new(:alias => "north", :toRoom => northRoom)
  end
  
  # > move north
  it "can move north" do
    player.location.should == startingRoom
    Navigation.move(player, "north").should true
    player.location.should == northRoom
  end

end
