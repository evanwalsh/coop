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
    
    # Public: A poor man's Arel for querying the status API
    #
    # options - A hash of options, which can include either or both of:
    #           user_id  => the id of the user
    #           date     => a Date object
    #
    # Examples
    #
    #   Status.new({ group_id: 12345 }).where({ user_id: 12345, date: Date.today })
    #
    # Returns Array of APIObjects
    def where(options = {})
      if options[:user_id] && options[:date]
        where_user_and_date(options[:user_id], options[:date])
      elsif options[:user_id]
        where_user(options[:user_id])
      elsif options[:date]
        where_date(options[:date])
      else
        recent
      end
    end
    
    # Private: Get statuses for user on a date
    #
    # user_id - the user's id
    # date - the Date object
    #
    # Examples
    #
    #   where_user_and_date(12345, Date.today)
    #
    # Returns Array of APIObjects
    def where_user_and_date(user_id, date)
      date = Date.parse(date.to_s).strftime("%Y%m%d")
      Coop.get_parsed("/groups/#{self.group_id}/users/#{user_id}/#{date}")
    end
    private :where_user_and_date
    
    # Private: Get statuses for user on a date
    #
    # user_id - the user's id
    #
    # Examples
    #
    #   where_user(12345)
    #
    # Returns Array of APIObjects
    def where_user(user_id)
      Coop.get_parsed("/groups/#{self.group_id}/users/#{user_id}")
    end
    private :where_user
    
    # Private: Get statuses for user on a date
    #
    # date - the Date object
    #
    # Examples
    #
    #   where_date(Date.today)
    #
    # Returns Array of APIObjects
    def where_date(date)
      date = Date.parse(date.to_s).strftime("%Y%m%d")
      Coop.get_parsed("/groups/#{self.group_id}/#{date}")
    end
    private :where_date
  end
end