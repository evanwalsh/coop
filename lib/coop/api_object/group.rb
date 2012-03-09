module Coop
  class Group < APIObject
    # Public: The base for all status API calls
    #
    # Examples
    #
    #   self.statuses
    #   # => #<Coop::Status @group_id=12345>
    #
    # Returns a Coop::Status instance with the group_id set
    def statuses
      Status.new({ group_id: self.id })
    end
    
    # Public: Post a status update to a group
    #
    # message - The text for the status update
    #
    # Examples
    #
    #   Group.new({ id: 12345 }).post! "Is this computer?"
    #   # => "/statuses/123456"
    #
    # Returns String of new status' URL
    def post!(message)
      Status.new({ group_id: self.id }).post!(message)
    end
    
    # Public: Post a status update to a group as Cobot
    #
    # message - The text for the status update
    # api_key - The API key needed to post as Cobot
    #
    # Examples
    #
    #   Group.new({ id: 12345 }).post_as_cobot! "YES, THIS IS COMPUTER", "THISISMYSECRETKEY"
    #   # => "/statuses/123456"
    #
    # Returns String of new status' URL
    def post_as_cobot!(message, api_key)
      Status.new({ group_id: self.id }).post_as_cobot!(message, api_key)
    end
    
    def agenda
      Agenda.new({ group_id: self.id })
    end
  end
end