class ListedStocksController < ApplicationController
  def search
    @listed_stocks = ListedStock.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")

    expires_in 1.year, public: true if Rails.env.development?

    render layout: false
  end
end
