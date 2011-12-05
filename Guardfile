guard 'rspec', :spec_paths => ["spec"],  :cli => "--color --fail-fast", :version => 2 do 
  watch(%r{^/spec/.+_spec\.rb$})
  watch(%r{^/spec/models/.+_spec\.rb$})
  watch(%r{^/spec/support/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
end

