require 'httparty'
require 'coop/error'
require 'coop/api_object'
require 'coop/session'
require 'coop/version'

module Coop
  include HTTParty
  base_uri 'http://coopapp.com'
  headers "Accept" => "application/json", "User-Agent" => "coop-gem"

  class << self
    # Public: Shortcut for creating a new Coop::Session for API stuff
    #
    # email - (String) the user's email
    # password - (String) the user's password
    #
    # Examples
    #
    #   Coop.new("test@example.com", "password123")
    #   # => #<Coop::Session @email="test@example.com">
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
    #   # => [{"type" => "Note", "users" => ...}]
    #
    # Returns Array of APIObjects or APIObject, depending on response argument
    def get_parsed(*args)
      begin
        request = self.get(*args)

        raise BadRequest if request.response.code == "400"
        raise Unauthorized if request.response.code == "401"
        raise NotFound if request.response.code == "404"
        raise InternalServerError if request.response.code == "500"
        raise ServiceUnavailable if request.response.code == "503"

        APIObject.parse_response(request)
      end
    end
  end
end
