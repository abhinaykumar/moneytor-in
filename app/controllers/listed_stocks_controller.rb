class ListedStocksController < ApplicationController

  def index
  end

  def search
    @listed_stocks = ListedStock.select(:id, :name).where('name ILIKE?', "%#{params[:q]}%")
    render layout: false
  end

end