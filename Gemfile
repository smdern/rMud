source :rubygems
require 'rbconfig'


gem 'eventmachine'
gem 'rake'

gem 'rspec'
gem 'guard'
gem 'guard-rspec'

if RbConfig::CONFIG['target_os'] =~ /darwin/i
  gem 'rb-fsevent'
  gem 'growl'
elsif RbConfig::CONFIG['target_os'] =~ /linux/i
  gem 'rb-inotify'
  gem 'libnotify'
elsif RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
  gem 'win32console'
  gem 'rb-fchange'
  gem 'rb-notifu'
end

