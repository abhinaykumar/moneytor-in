class ListedBanksController < ApplicationController
  def search
    @listed_banks = ListedBank.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")
    render layout: false
  end
end
