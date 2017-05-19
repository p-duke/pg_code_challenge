require 'rspec/expectations'

RSpec::Matchers.define :have_constant do |const|
  match do |model|
    model.const_defined?(const)
  end
end

