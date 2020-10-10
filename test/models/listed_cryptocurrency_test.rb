# == Schema Information
#
# Table name: listed_cryptocurrencies
#
#  id                   :bigint           not null, primary key
#  current_market_price :float
#  name                 :string
#  symbol               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_listed_cryptocurrencies_on_name  (name)
#
require 'test_helper'

class ListedCryptocurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
