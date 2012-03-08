require "coop/api_object"
require "coop/session"
require "coop/version"

module Coop
  class << self
    def new(email, password)
      Coop::Session.new(email, password)
    end
  end
end