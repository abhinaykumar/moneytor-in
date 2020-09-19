# == Schema Information
#
# Table name: listed_stocks
#
#  id                   :bigint           not null, primary key
#  current_market_price :float
#  date_of_listing      :date
#  face_value           :integer
#  listed_on            :string
#  name                 :string
#  symbol               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_listed_stocks_on_name  (name)
#
require 'test_helper'

class ListedStockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
