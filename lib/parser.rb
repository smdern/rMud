class Action
  def initialize actor, verb, args
  end
end

module CommandParser

  @@verbs = []

  def self.parse actor, args
    verb, args = args.split(" ", 2)

    verb = @@verbs.find {|x| x.name == verb}

    return nil unless verb

    Action.new(actor, verb, args)

  end

  def self.define_verb verb
   @@verbs << verb;
  end

end
