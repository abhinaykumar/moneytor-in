# == Schema Information
#
# Table name: saving_accounts
#
#  id               :bigint           not null, primary key
#  amount_saved     :float
#  branch_name      :string
#  rate_of_interest :float            default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  listed_bank_id   :bigint           not null
#  portfolio_id     :bigint           not null
#
# Indexes
#
#  index_saving_accounts_on_listed_bank_id  (listed_bank_id)
#  index_saving_accounts_on_portfolio_id    (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (listed_bank_id => listed_banks.id)
#  fk_rails_...  (portfolio_id => portfolios.id)
#
class SavingAccount < ApplicationRecord
  belongs_to :portfolio
  belongs_to :listed_bank

  default_scope { includes(:listed_bank) }

  def self.sum_of_investment
    sum(:amount_saved)
  end
end
