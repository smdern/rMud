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

  # # > look player
  it "should return a description of a player" do
    Actions.look(playerA, "Raistlin")
    playerA.send_text.first.should == "Raistlin"
    playerA.send_text.last.should == playerB_description
  end

  it"should notify player if the target isn't in the room" do
    Actions.look(playerA, "Nudge Nudge Guy")
    playerA.send_text.first.should == "That person isn't here."
  end

  # # > look direction
  # it "should return the direction's room short description" do
  #   Actions.look(playerA, "north")
  #   playerA.send_text.first.should == "north_short_desc"

  # end
end

describe Actions, "exits" do
  let(:startingRoom) { Room.new(:title => "start") }
  let(:playerA) { Player.new(:name => "Tetto") }
  let(:northRoom) { Room.new(:title => "north room") }
  let(:eastRoom) { Room.new(:title => "east room") }
  let(:upRoom) { Room.new(:title => "up dawg") }

  before do
    Navigation.raw_move(playerA, startingRoom)
    startingRoom.exits << Exit.new(:alias => "north", :toRoom => northRoom)
    startingRoom.exits << Exit.new(:alias => "up", :toRoom => upRoom)
    startingRoom.exits << Exit.new(:alias => "east", :toRoom => eastRoom)
  end

  # > exits
  it "should return a list of exits and their room title" do
    Actions.exits(playerA)
    playerA.send_text.first.should == "Obvious exits:"
    playerA.send_text[1].should == "North - north room"
    playerA.send_text[2].should == "East  - east room"
    playerA.send_text[3].should == "Up    - up dawg"
  end
end

describe Actions, "say" do
  let(:room) { Room.new(:title => "room",
                        :long_description => "long_desc",
                        :short_description => "short_desc"
                       )
  }
  let(:playerA) { Player.new(:name => "Tetto") }
  let(:playerB) { Player.new(:name => "Raistlin") }
  let(:playerC) { Player.new(:name => "Elminister") }

  before do
    Navigation.raw_move(playerA, room)
    Navigation.raw_move(playerB, room)
    Navigation.raw_move(playerC, room)
  end
  # > say 'hi'
  it "all players in the room should receive 'hi'" do
    Actions.say(playerA, "hi")
    playerB.send_text.first.should == "#{playerA.name} says 'hi'"
    playerC.send_text.first.should == "#{playerA.name} says 'hi'"
    playerA.send_text.first.should == "You say 'hi'"
  end
end

describe Actions, "scan" do
  let(:startRoom) { Room.new(:title => 'start room') }
  let(:room1s) { Room.new(:title => "room1s") }
  let(:room2s) { Room.new(:title => "room2s") }
  let(:room3s) { Room.new(:title => "room3s") }
  let(:room4s) { Room.new(:title => "room4s") }
  let(:room5s) { Room.new(:title => "room5s") }
  let(:room1e) { Room.new(:title => "room1e") }
  let(:room2e) { Room.new(:title => "room2e") }
  let(:room3e) { Room.new(:title => "room3e") }
  let(:room1e1s) { Room.new(:title => "room1e1s") }
  let(:startPlayer) { Player.new(:name => "startPlayer") }
  let(:startOtherPlayer) { Player.new(:name => "Other person") }
  let(:player1s) { Player.new(:name => "player1s") }
  let(:player2s) { Player.new(:name => "player2s") }
  let(:player4s) { Player.new(:name => "player4s") }
  let(:player5s) { Player.new(:name => "player5s") }
  let(:player2e) { Player.new(:name => "player2e") }
  let(:player1e1s) { Player.new(:name => "player1e1s") }

  before do
    startRoom.exits << Exit.new(:alias => "south", :toRoom => room1s)
    startRoom.exits << Exit.new(:alias => "east", :toRoom => room1e)
    room1s.exits << Exit.new(:alias => "south", :toRoom => room2s)
    room2s.exits << Exit.new(:alias => "south", :toRoom => room3s)
    room3s.exits << Exit.new(:alias => "south", :toRoom => room4s)
    room4s.exits << Exit.new(:alias => "south", :toRoom => room5s)
    room1e.exits << Exit.new(:alias => "east", :toRoom => room2e)
    room1e.exits << Exit.new(:alias => "south", :toRoom => room1e1s)
    Navigation.raw_move(player1s, room1s)
    Navigation.raw_move(player2s, room2s)
    Navigation.raw_move(player4s, room4s)
    Navigation.raw_move(player5s, room5s)
    Navigation.raw_move(player1e1s, room1e1s)
    Navigation.raw_move(player2e, room2e)
    Navigation.raw_move(startPlayer, startRoom)
    Navigation.raw_move(startOtherPlayer, startRoom)
  end
  # > scan
  it "should return contents of rooms in a line" do
    Actions.scan(startPlayer)
    startPlayer.send_text[0].should == "You peer intently all around, and see :"
    startPlayer.send_text[1].should == "                  Other person : right here"
    startPlayer.send_text[2].should == "                      player1s : immediately to the south"
    startPlayer.send_text[3].should == "                      player2s : nearby to the south"
    startPlayer.send_text[4].should == "                      player4s : a ways to the south"
    startPlayer.send_text[5].should == "                      player5s : far to the south"
    startPlayer.send_text[6].should == "                      player2e : nearby to the east"
  end
end
