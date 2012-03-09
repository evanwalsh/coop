module Coop
  class Group < APIObject
    # Public: The base for all status API calls
    #
    # Examples
    #
    #   self.statuses
    #
    # Returns a Coop::Status instance with the group_id set
    def statuses
      Status.new({ group_id: self.id })
    end
    
    def post!(message)
      Status.new({ group_id: self.id }).post!(message)
    end
    
    def post_as_cobot!(message, api_key)
      Status.new({ group_id: self.id }).post_as_cobot!(message, api_key)
    end
  end
end