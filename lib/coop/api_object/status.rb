module Coop
  class Status < APIObject
    # Public: Get a group's 50 most recent tweets
    #
    # Examples
    #
    #   Status.new({ group_id: 12345 }).recent
    #
    # Returns an Array of statuses as APIObjects
    def recent
      Coop.get_parsed("/groups/#{self.group_id}/statuses")
    end
  end
end