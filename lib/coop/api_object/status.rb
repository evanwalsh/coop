module Coop
  class Status < APIObject
    # Public: Get a group's 50 most recent tweets
    #
    # Examples
    #
    #   Status.new({ group_id: 12345 }).recent
    #   # => [{"type" => "Note", "users" => ...}]
    #
    # Returns an Array of statuses as APIObjects
    def recent
      Coop.get_parsed("/groups/#{self.group_id}/statuses")
    end
    
    # Public: Post a status update to a group
    #
    # message - The text for the status update
    #
    # Examples
    #
    #   Status.new({ group_id: 12345 }).post! "Is this computer?"
    #   # => "/statuses/123456"
    #
    # Returns String of new status' URL
    def post!(message)
      Coop.post(
        "/groups/#{self.group_id}/statuses", 
        query: { status: message }, 
        headers: { "Accept" => "application/xml" }
      ).headers["Location"]
    end
    
    # Public: Post a status update to a group as Cobot
    #
    # message - The text for the status update
    # api_key - The API key needed to post as Cobot
    #
    # Examples
    #
    #   Status.new({ group_id: 12345 }).post_as_cobot! "YES, THIS IS COMPUTER", "THISISMYSECRETKEY"
    #   # => "/statuses/123456"
    #
    # Returns String of new status' URL
    def post_as_cobot!(message, api_key)
      Coop.post(
        "/groups/#{self.group_id}/statuses",
        query: { status: message, key: api_key }, 
        headers: { "Accept" => "application/xml" }
      ).headers["Location"]
    end
  end
end