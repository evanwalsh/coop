require 'httparty'
require 'coop/api_object'
require 'coop/session'
require 'coop/version'

module Coop
  include HTTParty
  base_uri 'http://coopapp.com'
  headers "Accept" => "application/json"
  
  class << self
    # Public: Shortcut for creating a new Coop::Session for API stuff
    #
    # email - (String) the user's email
    # password - (String) the user's password
    #
    # Examples
    #
    #   Coop.new("test@example.com", "password123")
    #
    # Returns an authenticated Coop::Session object
    def new(email, password)
      basic_auth email, password      
      Coop::Session.new(email, password)
    end
    
    # Public: Parse an HTTParty response into APIObjects
    #
    # *args - any valid arguments for HTTParty.get
    #
    # Examples
    #
    #   Coop.get_parsed("/groups/12345")
    #
    # Returns Array or APIObject, depending on response
    def get_parsed(*args)
      APIObject.parse_response(self.get(*args))
    end
  end
end