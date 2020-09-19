# == Schema Information
#
# Table name: listed_mutual_funds
#
#  id         :bigint           not null, primary key
#  name       :string
#  nav        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ListedMutualFundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
