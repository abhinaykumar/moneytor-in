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
class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :stocks, dependent: :destroy
  has_many :mutual_funds, dependent: :destroy
  has_many :saving_accounts, dependent: :destroy
  has_many :cryptocurrencies, dependent: :destroy

  scope :default, -> { find_by(name: 'default') }
end
