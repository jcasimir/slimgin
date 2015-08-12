require 'simplecov'
SimpleCov.start

require 'rspec'


RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end


# require 'minitest'
# require 'minitest/pride'
# require 'minitest/mock'
# require 'minitest/autorun'


require 'pry'
