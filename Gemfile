source :rubygems

gem 'eventmachine'
gem 'rake'

gem 'rspec'
gem 'guard'
gem 'guard-rspec'

platforms :mswin, :mingw do
  gem 'win32console'
  gem 'rb-fchange'
  gem 'rb-notifu'
end

platforms :ruby do
  gem 'rb-fsevent', require: false
  gem 'growl', require: false
  gem 'rb-inotify', require: false
  gem 'libnotify', require: false
end

