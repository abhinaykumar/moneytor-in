# == Schema Information
#
# Table name: stocks
#
#  id              :bigint           not null, primary key
#  brokerage       :float
#  investment_date :date
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
# rails g scaffold MutualFund invetment_type:string date_of_invetment:date units:float invetment_amount:float portfolio:references
class Stock < ApplicationRecord
  belongs_to :portfolio
  belongs_to :listed_stock

  def self.sum_of_investment
    sum(:price)
  end
end
