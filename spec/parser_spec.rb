require 'spec_helper'
require 'actions'
require 'player'
require 'room'
require 'exit'
require 'navigation'
require 'parser'
require 'verb'

describe CommandParser, "parse command" do
  let(:verbLook) { Verb.new("l*ook") { "xxx"} }
  let(:verbMove) { Verb.new("move") { "zzz"} }

  before do
    CommandParser.define_verb verbLook
    CommandParser.define_verb verbMove
  end 

  it "should work" do
    CommandParser.parse(nil, "move").should_not == nil
  end

end
