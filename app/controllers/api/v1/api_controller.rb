module Api
  module V1
    class ApiController < ActionController::Base
      include RescueExceptions

      attr_reader :current_user

      before_action :set_current_user
      skip_before_action :verify_authenticity_token

      def render_api_success(serializer, obj, _options = {})
        render json: serializer.new(obj)
      end

      def render_api_error(messages, code)
        data = { errors: { code: code, details: Array.wrap(messages) } }
        render json: data, status: code
      end

      protected

      def set_current_user
        return if request.headers['Authorization'].blank?

        bearer_token = request.headers['Authorization'].split(' ').last

        context = AuthenticateUser.call(bearer_token: bearer_token)
        raise Exceptions::Unauthorized, context.error if context.failure?

        @current_user = context.user
      end
    end
  end
end
