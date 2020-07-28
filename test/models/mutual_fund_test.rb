# == Schema Information
#
# Table name: mutual_funds
#
#  id                :bigint           not null, primary key
#  date_of_invetment :date
#  invetment_amount  :float
#  invetment_type    :string
#  name              :string
#  units             :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  portfolio_id      :bigint           not null
#
# Indexes
#
#  index_mutual_funds_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#
require 'test_helper'

class MutualFundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
