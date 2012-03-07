require 'hashie'

Dir[File.expand_path('api_object/*.rb', __FILE__)].each{ |f| require f }

class APIObject < Hashie::Mash
  
end