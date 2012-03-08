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
      Status.new({
        group_id: self.id
      })
    end
  end
end