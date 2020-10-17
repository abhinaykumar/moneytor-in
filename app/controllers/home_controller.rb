class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    default_portfolio = current_user.portfolios.default
    @total_investment_in_portfolio = 0
    @asset_classes = AssetClass.select(:name, :internal_name).order(:created_at)
    @assets = {}
    @asset_classes.each do |asset_class|
      asset = asset_class.internal_name.classify.constantize.where(portfolio: default_portfolio)
      next unless asset.present?

      @assets[asset_class.internal_name.to_sym] = { items: asset }
      total_investment_in_asset = default_portfolio.public_send("sum_of_investment_in_#{asset_class.internal_name}")
      @total_investment_in_portfolio += total_investment_in_asset
      @assets[asset_class.internal_name.to_sym].merge!(total: total_investment_in_asset)
    end
  end

  def terms
  end

  def privacy
  end
end
