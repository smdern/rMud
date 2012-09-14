require 'rubygems'
require 'rspec'


lib = File.join(File.dirname(__FILE__), '..', 'lib/*.rb')

Dir[lib].each {|file| require file }
