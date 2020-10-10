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
require 'test_helper'

class CryptocurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
