require 'action'

describe Action, "action doesnt' exist" do
end

describe Action, "look" do
  let(:playerA) { Player.new }
  let(:playerB) { Player.new }
  let(:startingRoom) { Room.new }
  let(:northRoom) { Room.new }
  let(:southRoom) { Room.new }
  let(:eastRoom) { Room.new }
  let(:more_eastRoom) { Room.new }

  before do

  end

  # > look
  it "should return room title, long description, exits and contents" do

  end

  # > look player
  it "should return a description of a player and their inventory" do

  end

  # > look direction
  it "should return the direction's room short description" do

  end
end

describe Action, "exit" do

  it "should return a list of exits and their room title" do

  end
end
