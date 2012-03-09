require 'hashie'

module Coop
  class APIObject < Hashie::Mash    
    # Public: Parse an HTTParty Response into a single APIObject or an Array of such
    #
    # response - The HTTParty Response object that will be parsed
    #
    # Examples
    #
    #   APIObject.parse_response(HTTParty.get("http://coopapp.com/groups"))
    #   # => [{"type" => "Note", "users" => ...}]
    #
    # Returns a singular or array of APIObjects, depending on what it's fed
    def self.parse_response(response)
      response = response.parsed_response
      if response.class == Array
        output = Array.new
        response.each do |item|
          output << self.new(item)
        end
      elsif response.class == Hash
        output = self.new(response)
      end
      
      output
    end
  end
  
  %w(agenda group status user).each{ |o| require "coop/api_object/#{o}" }
end