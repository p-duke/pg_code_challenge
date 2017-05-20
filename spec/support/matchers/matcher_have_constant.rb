require 'rspec/expectations'

RSpec::Matchers.define :be_const_defined do |const|
  match do |model|
    model.const_defined?(const)
  end
end

