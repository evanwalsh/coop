require 'minitest/autorun'
require 'turn/autorun'
require 'webmock/test_unit'
require 'coop'

include WebMock::API
stub_request(:any, Coop.base_uri)

def fixture(file)
  File.read(File.join(Dir.pwd, 'test', 'fixtures', file))
end

def auth_path(path)
  "http://test%40example.com:password@coopapp.com#{path}"
end

def stub_delete(path)
  stub_request(:delete, auth_path(path))
end

def stub_get(path)
  stub_request(:get, auth_path(path))
end

def stub_post(path)
  stub_request(:post, auth_path(path))
end

def stub_put(path)
  stub_request(:put, auth_path(path))
end

# WebMock.after_request do |request_signature, response|
#   puts "Request #{request_signature} was made and #{response} was returned"
# end