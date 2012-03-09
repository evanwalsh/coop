module Coop
  # Standard class for errors
  class Error < StandardError; end

  # Raised when Co-op returns the HTTP status code 400
  class BadRequest < Error; end
  
  # Raised when Co-op returns the HTTP status code 401
  class Unauthorized < Error; end

  # Raised when Co-op returns the HTTP status code 404
  class NotFound < Error; end

  # Raised when Co-op returns the HTTP status code 500
  class InternalServerError < Error; end

  # Raised when Co-op returns the HTTP status code 503
  class ServiceUnavailable < Error; end
end