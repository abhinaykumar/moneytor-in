module RescueExceptions
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |e|
      # Other exceptions than ApiErrors get converted to an internal server error
      error = Exceptions::InternalServerError.new e
      Rails.logger.info e.message
      Rails.logger.info e.backtrace.join($/)
      render json: error.to_json, status: error.status_code
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error = Exceptions::NotFound.new e, e.message.downcase
      render json: error.to_json, status: error.status_code
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error = Exceptions::ValidationError.new e.record.errors.messages
      render json: error.to_json, status: error.status_code
    end

    rescue_from ActionController::ParameterMissing do |e|
      error = Exceptions::ValidationError.new e.message
      render json: error.to_json, status: error.status_code
    end

    rescue_from Exceptions::Unauthorized do |e|
      error = Exceptions::Unauthorized.new e, e.message
      render json: error.to_json, status: error.status_code
    end

    rescue_from Exceptions::UnprocessableEntity do |e|
      error = Exceptions::UnprocessableEntity.new e, e.message.downcase
      render json: error.to_json, status: error.status_code
    end

    rescue_from Exceptions::BadRequest do |e|
      error = Exceptions::BadRequest.new e, e.message
      render json: error.to_json, status: error.status_code
    end

  end

end
