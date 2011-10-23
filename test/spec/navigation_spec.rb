
require 'exit'
require 'room'
require 'player'
require 'navigation'

describe Navigation, "Traverse Rooms" do
  let(:player) { Player.new(:name => "Elminister") }
  let(:northRoom) { Room.new(:title => "north room") }
  let(:startingRoom) { Room.new(:title => "starting room") }

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
      northRoom.contents.should_not include player
      Navigation.move(player, "north")
      startingRoom.contents.should_not include player
      northRoom.contents.should include player
  end

  it "shouldn't move if exit doesn't exist" do
    startingRoom.contents.should include player
    Navigation.move(player, "south")
    startingRoom.contents.should include player
  end

end

describe Navigation, "Players receive success/error message" do
  let(:player) { Player.new(:name => "Elminister") }
  let(:startingRoom) { Room.new(:name => "starting Room") }
  let(:northRoom) { Room.new(:name => "northing room") }

  before do
    Navigation.raw_move(player, startingRoom)
    startingRoom.exits.push Exit.new(:alias => "north", :toRoom => northRoom)
  end

  it "should report success message to Player " do
      Navigation.move(player, "north")
      player.send_text.should include "You move north"
  end

  it "should report failure message to Player" do
    Navigation.move(player, "south")
    player.send_text.should include "You can't move south"
  end

end
