# == Schema Information
#
# Table name: asset_classes
#
#  id            :bigint           not null, primary key
#  internal_name :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class AssetClassTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
