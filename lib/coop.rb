require 'coop/api_object'
require 'coop/session'
require 'coop/version'

module Coop
  include HTTParty
  base_uri 'http://coopapp.com'
  headers "Accept" => "application/json"
  
  class << self
    def new(email, password)
      Coop::Session.new(email, password)
    end
  end
end