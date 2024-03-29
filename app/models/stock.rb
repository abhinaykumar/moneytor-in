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
class Stock < ApplicationRecord
  belongs_to :portfolio
  belongs_to :listed_stock

  default_scope { includes(:listed_stock) }

  validates :at_price, presence: true
  validates :quantity, presence: true

  after_validation :calculate_investment_amount
  after_commit :calculate_sum_of_investment

  def owner?(user_id)
    portfolio.user_id == user_id
  end

  private

  def calculate_investment_amount
    self.investment_amount = quantity * at_price
  end

  def calculate_sum_of_investment
    portfolio.update sum_of_investment_in_stocks: self.class.where(portfolio: portfolio)
                                                      .sum(:investment_amount)
  end
end
