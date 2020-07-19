module Exceptions
  class ApiError < Exception
    def self.status_code
      400
    end

    def status_code
      self.class.status_code
    end

    def initialize(message, details = nil)
      super(message)
      details = details.map { |k, v| "#{k},#{v.join('&')}" } if details.is_a? Hash
      @details = details unless status_code == 500
    end

    def to_json
      return {
        error: @details
      }
    end
  end

  class BadRequest < ApiError
    def self.status_code
      400
    end
  end

  class ValidationError < ApiError
    def initialize(details)
      super "Validation Error", details
    end
  end

  class Unauthorized < ApiError
    def self.status_code
      401
    end
  end

  class Forbidden < ApiError
    def self.status_code
      403
    end
  end

  class NotFound < ApiError
    def self.status_code
      404
    end
  end

  class UnprocessableEntity < ApiError
    def self.status_code
      422
    end
  end

  class InternalServerError < ApiError
    def initialize(e)
      super "Internal Server Error", e.backtrace.join("\n")
    end

    def self.status_code
      500
    end
  end

  class InvalidSource < ApiError
    def initialize(details)
      super "Invalid source", details
    end

    def self.status_code
      400
    end
  end
end
