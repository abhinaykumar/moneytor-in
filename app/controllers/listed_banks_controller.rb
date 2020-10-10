class ListedBanksController < ApplicationController
  def search
    @listed_banks = ListedBank.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")

    expires_in 1.year, public: true if Rails.env.development?

    render layout: false
  end
end
