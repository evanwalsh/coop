module Coop
  class User < APIObject
    # Public: List of a group's users with all info
    #
    # Examples
    #
    #   User.new({ group_id: 12345 }).all
    #   # => [#<Coop::APIObject>, #<Coop::APIObject>, ...]
    #
    # Returns Array of APIObjects with user data
    def all
      Coop.get_parsed("/group/#{self.group_id}/users")
    end
    
    # Public: User data for one user
    #
    # id - The user's id
    #
    # Examples
    #
    #   User.find(12345)
    #   # => #<Coop::APIObject>
    #
    # Returns  APIObject with user data
    def self.find(id)
      Coop.get_parsed("/users/#{id}")
    end
  end
end