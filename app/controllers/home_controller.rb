class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    default_portfolio = current_user.portfolios.default
    default_asset = 'stocks'
    @asset = {}
    @asset[default_asset.to_sym] = default_portfolio.stocks.includes(:listed_stock)
    # TODO: Portfolio should have a method 'sum_of_all_investments'
    @asset.merge!(total: default_portfolio.stocks.sum_of_investment)
    @asset_classes = AssetClass.select(:name, :internal_name).order(:created_at)
  end

  def terms
  end

  def privacy
  end
end
