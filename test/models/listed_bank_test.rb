# == Schema Information
#
# Table name: listed_banks
#
#  id         :bigint           not null, primary key
#  name       :string
#  sector     :string
#  symbol     :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ListedBankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
