class ListedCryptocurrenciesController < ApplicationController
  def search
    @listed_cryptocurrencies = ListedCryptocurrency.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")

    expires_in 1.year, public: true if Rails.env.development?

    render layout: false
  end
end
