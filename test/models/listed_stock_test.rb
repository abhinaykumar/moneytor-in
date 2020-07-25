# == Schema Information
#
# Table name: listed_stocks
#
#  id              :bigint           not null, primary key
#  date_of_listing :date
#  face_value      :integer
#  listed_on       :string
#  name            :string
#  symbol          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class ListedStockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
