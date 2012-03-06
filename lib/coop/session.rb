module Coop
  class Session
    attr_accessor :email
    
    def initialize(email, password)
      @email = email
      @password = password
    end
  end
end