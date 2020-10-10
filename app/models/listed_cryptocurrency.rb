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
class ListedCryptocurrency < ApplicationRecord
  has_many :cryptocurrencies
end
