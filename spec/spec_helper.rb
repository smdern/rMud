require 'rubygems'
require 'rspec'
require 'rspec/autorun'

require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

File.join(File.dirname(__FILE__), '..', 'lib')
File.join(File.dirname(__FILE__))
