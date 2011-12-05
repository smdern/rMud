$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'rspec/autorun'

require 'factory_girl'

RSpec.configure do |c|
  c.mock_with :rspec
end
