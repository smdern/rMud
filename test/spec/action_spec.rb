
describe Action, "action doesnt' exist" do
  it "should return a notice to the player" do

  end
end

describe Action, "look" do
  let(:player) { Player.new }
  let(:room) { Room.new }

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
