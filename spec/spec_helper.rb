require File.expand_path('../../lib/behance', __FILE__)
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def stub_get(path)
  stub_request(:get, Behance::Client::API_URL + path)
end

def a_get(path)
  a_request(:get, Behance::Client::API_URL + path)
end
