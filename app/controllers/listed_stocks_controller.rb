class ListedStocksController < ApplicationController

  def index
    @listed_stocks = ListedStock.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")
    render layout: false
  end
end