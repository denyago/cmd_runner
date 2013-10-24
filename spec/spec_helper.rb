require 'rspec'
require 'rspec/mocks'
require 'pry'

require 'cmd_runner'

RSpec.configure do |config|
  config.color_enabled = true
  config.mock_with :rspec
end
