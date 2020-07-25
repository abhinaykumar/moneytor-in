# == Schema Information
#
# Table name: stocks
#
#  id              :bigint           not null, primary key
#  brokerage       :float
#  investment_date :date
#  name            :string
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  listed_stock_id :bigint
#  portfolio_id    :bigint
#
# Indexes
#
#  index_stocks_on_listed_stock_id  (listed_stock_id)
#  index_stocks_on_portfolio_id     (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (listed_stock_id => listed_stocks.id)
#  fk_rails_...  (portfolio_id => portfolios.id)
#
require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
