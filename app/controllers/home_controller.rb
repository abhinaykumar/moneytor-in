class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @asset_class = AssetClass.select(:name)
  end

  def terms
  end

  def privacy
  end
end
