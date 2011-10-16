guard 'rspec', :spec_paths => ["test/spec"],  :version => 2 do
  watch(%r{^test/spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "test/spec/#{m[1]}_spec.rb" }
end

