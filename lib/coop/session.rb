module Coop
  class Session
    attr_accessor :email
    
    def initialize(email, password)
      @email = email
      @password = password
    end
    
    def group(id)
      Coop::Group.new(id)
    end
  end
end