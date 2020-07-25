module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :authenticate_token, only: [:create]

      def create
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          # render response with serializer
          render_api_success(serializer, user)
        else
          # render error
          render_api_error('Invalid email or password', 401)
        end
      end

      private

      def serializer
        SessionSerializer
      end

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end