class ListedMutualFundsController < ApplicationController
  def search
    # make an API call to valueresearch to get the list of mutual funds.
    # make sure to set the headers.
    @mutual_funds = ValueResearchServices::GetMutualFunds.call(params[:q])

    expires_in 1.year, public: true if Rails.env.development?

    render layout: false
  end
end
