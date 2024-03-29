# == Schema Information
#
# Table name: mutual_funds
#
#  id                    :bigint           not null, primary key
#  at_nav                :float
#  date_of_investment    :date
#  investment_amount     :float
#  name                  :string
#  units                 :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  listed_mutual_fund_id :bigint           not null
#  portfolio_id          :bigint           not null
#
# Indexes
#
#  index_mutual_funds_on_listed_mutual_fund_id  (listed_mutual_fund_id)
#  index_mutual_funds_on_portfolio_id           (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (listed_mutual_fund_id => listed_mutual_funds.id)
#  fk_rails_...  (portfolio_id => portfolios.id)
#
class MutualFund < ApplicationRecord
  belongs_to :portfolio
  belongs_to :listed_mutual_fund

  after_validation :calculate_units

  after_commit :calculate_sum_of_investment

  def owner?(user_id)
    portfolio.user_id == user_id
  end

  private

  def calculate_units
    self.units = investment_amount / at_nav
  end

  def calculate_sum_of_investment
    portfolio.update sum_of_investment_in_mutual_funds: self.class.where(portfolio: portfolio)
                                                            .sum(:investment_amount)
  end
end
