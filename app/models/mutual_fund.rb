# == Schema Information
#
# Table name: mutual_funds
#
#  id                 :bigint           not null, primary key
#  date_of_investment :date
#  investment_amount  :float
#  investment_type    :string
#  name               :string
#  nav                :float
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
class MutualFund < ApplicationRecord
  belongs_to :portfolio

  def self.sum_of_investment
    sum(:investment_amount)
  end

end
