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
# Indexes
#
#  index_listed_mutual_funds_on_name  (name)
#
class ListedMutualFund < ApplicationRecord
  has_many :mutual_funds, dependent: :destroy

  def self.create_by(params)
    ListedMutualFund.create!(name: params[:name])
  end
end
