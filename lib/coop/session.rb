module Coop
  class Session
    attr_accessor :email
    
    # Public: Creates a new API session
    #
    # email - (String) the user's email
    # password - (String) the user's password
    #
    # Examples
    #
    #   Coop::Session.new("test@example.com", "password123")
    #   # => #<Coop::Session @email="test@example.com">
    #
    # Returns a Coop::Session instance
    def initialize(email, password)
      @email = email
      password = password
    end
    
    # Public: Creates a Coop::Group object
    #
    # id - (Fixnum) the group id (as found in the app URL: http://coopapp.com/groups/[group_id])
    #
    # Examples
    #
    #   session.group(12345)
    #   # => #<Coop::Group @id=12345>
    #
    # Returns a Coop::Group instance
    def group(id)
      Coop::Group.new({
        id: id
      })
    end
    
    # Public: Creates a Coop::Group object
    #
    # id - (Fixnum) the group id (as found in the app URL: http://coopapp.com/groups/[group_id]/users/[user_id])
    #
    # Examples
    #
    #   session.user(12345)
    #   # => #<Coop::User @id=12345>
    #
    # Returns a Coop::User instance
    def user(id)
      Coop::User.new({
        id: id
      })
    end
  end
end