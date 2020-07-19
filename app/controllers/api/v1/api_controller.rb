module Api
  module V1
    class ApiController < ActionController::Base
      include RescueExceptions

      before_action :authenticate_token
      skip_before_action :verify_authenticity_token

      def render_api_success(serializer, obj, _options = {})
        render json: serializer.new(obj)
      end

      def render_api_error(messages, code)
        data = { errors: { code: code, details: Array.wrap(messages) } }
        render json: data, status: code
      end

      private

      def authenticate_token
        # begin
        #   decoded_token = JWT.decode token
        # rescue JWT::ExpiredSignature
        #   # Handle expired token, e.g. logout user or deny access
        # end
      end

      def current_user
        @current_user
      end
    end
  end
end