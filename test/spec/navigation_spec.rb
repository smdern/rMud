
require 'exit'
require 'room'
require 'player'
require 'navigation'

describe Navigation, "Room Navigation"do
  let(:player) { Player.new }
  let(:northRoom) { Room.new }
  let(:startingRoom) { Room.new }

  before do
    Navigation.raw_move(player, startingRoom)
    startingRoom.exits.push Exit.new(:alias => "north", :toRoom => northRoom)
  end

  # > move north
  it "can move north" do
    player.location.should == startingRoom
    startingRoom.contents.should include player
    Navigation.move(player, "north").should == true
    player.location.should == northRoom
  end

  it "should update rooms contents when player enter/leaving" do
      startingRoom.contents.should include player
      Navigation.move(player, "north")
      startingRoom.contents.should_not include player
      northRoom.contents.should include player
  end

  it "should catch illegal room moves" do
    Navigation.move(player, "south").should == false
  end
end
