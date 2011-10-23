require 'actions'
require 'player'
require 'room'
require 'exit'
require 'navigation'

describe Actions, "look" do
  let(:playerB_description) { "Description about playerB" }
  let(:startingRoom_long_description) { "This is long description of the starting room" }
  let(:startingRoom_short_description) { "this is the starting room" }
  let(:startingRoom_title) { "Starting Room" }
  let(:playerA) { Player.new(:name => 'Tetto') }
  let(:playerB) { Player.new(:name => "Raistlin", :description => playerB_description) }
  let(:startingRoom) { Room.new(:title => startingRoom_title,
                                :long_description => startingRoom_long_description,
                                :short_description => startingRoom_short_description)
  }
  let(:northRoom) { Room.new(:title => "north room",
                             :long_description => "north_long_desc",
                             :short_description => "north_short_desc"
                             )
  }
  let(:eastRoom) { Room.new(:title => "east room") }

  before do
    Navigation.raw_move(playerA, startingRoom)
    Navigation.raw_move(playerB, startingRoom)
    startingRoom.exits << Exit.new(:alias => "north", :toRoom => northRoom)
    startingRoom.exits << Exit.new(:alias => "east", :toRoom => eastRoom)
  end

  # > look
  it "should return room title, long description, exits and contents" do
    Actions.look(playerA)
    playerA.send_text.first.should == startingRoom_title
    playerA.send_text[1].should == startingRoom_long_description
    playerA.send_text[2].should == "Exits: North, East"
    playerA.send_text.last.should == "Raistlin"
  end

  # > look player
  it "should return a description of a player and their inventory" do
    Actions.look(playerA, "Raistlin")
    playerA.send_text.first.should == "Raistlin"
    playerA.send_text.last.should == playerB_description
  end

  # > look direction
  it "should return the direction's room short description" do
    Actions.look(playerA, "north")
    playerA.send_text.first.should == "north_short_desc"

  end
end

describe Actions, "exit" do

  # > exit
  it "should return a list of exits and their room title" do
    pending "exit stuff"
  end
end
