class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @asset = {}
    @assets[:stocks] = current_user.stocks
  end

  def terms
  end

  def privacy
  end
end
