

guard 'rspec', :cli => "--color" do
  watch(%r{^spec/.+_spec\.rb$}) 
  watch(%r{^lib/(.+)\.rb$})   { "spec" } # { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.treetop$})   { "spec" }
  watch(%r{^lib/(.+)\.csv$})   { "spec" }
  #watch(%r{^spec/support/(.+)\.rb$})   { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^(.+)\.coffee$})   { "spec" }
  watch(%r{^(.+)\.js$})   { "spec" }
end





