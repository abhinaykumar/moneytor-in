# == Schema Information
#
# Table name: mutual_funds
#
#  id                 :bigint           not null, primary key
#  current_nav        :float
#  date_of_investment :date
#  investment_amount  :float
#  investment_type    :string
#  name               :string
#  units              :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  portfolio_id       :bigint           not null
#
# Indexes
#
#  index_mutual_funds_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#
require 'test_helper'

class MutualFundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
