# == Schema Information
#
# Table name: stocks
#
#  id                :bigint           not null, primary key
#  at_price          :float
#  investment_amount :float
#  investment_date   :date
#  quantity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  listed_stock_id   :bigint
#  portfolio_id      :bigint
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
class StockSerializer < ApplicationSerializer
  include JSONAPI::Serializer
  attributes :at_price, :investment_amount
end
