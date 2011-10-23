class Verb

  attr_accessor(:name) 

  def initialize name, &func 
    @name = name
    @proc = func
  end


end
