module Api
  module V1
    class StocksController < ApiController
      def index
        render_api_success(serializer, Stock.all)
      end

      private

      def serializer
        StockSerializer
      end
    end
  end
end
