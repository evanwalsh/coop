require 'hashie'

module Coop
  class APIObject < Hashie::Mash

  end
  
  %w(agenda group status user).each{ |o| require "coop/api_object/#{o}" }
end