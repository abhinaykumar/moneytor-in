# == Schema Information
#
# Table name: cryptocurrencies
#
#  id                       :bigint           not null, primary key
#  at_price                 :float
#  investment_amount        :float
#  investment_date          :date
#  quantity                 :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  listed_cryptocurrency_id :bigint           not null
#  portfolio_id             :bigint           not null
#
# Indexes
#
#  index_cryptocurrencies_on_listed_cryptocurrency_id  (listed_cryptocurrency_id)
#  index_cryptocurrencies_on_portfolio_id              (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (listed_cryptocurrency_id => listed_cryptocurrencies.id)
#  fk_rails_...  (portfolio_id => portfolios.id)
#
class Cryptocurrency < ApplicationRecord
  belongs_to :listed_cryptocurrency
  belongs_to :portfolio

  default_scope { includes(:listed_cryptocurrency) }

  validates :at_price, presence: true
  validates :quantity, presence: true

  after_validation :calculate_investment_amount

  def self.sum_of_investment
    sum(:investment_amount)
  end

  private

  def calculate_investment_amount
    self.investment_amount = quantity * at_price
  end
end
