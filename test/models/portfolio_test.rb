# == Schema Information
#
# Table name: portfolios
#
#  id                                    :bigint           not null, primary key
#  name                                  :string
#  sum_of_investment_in_cryptocurrencies :float            default(0.0)
#  sum_of_investment_in_mutual_funds     :float            default(0.0)
#  sum_of_investment_in_saving_accounts  :float            default(0.0)
#  sum_of_investment_in_stocks           :float            default(0.0)
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  user_id                               :bigint           not null
#
# Indexes
#
#  index_portfolios_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
