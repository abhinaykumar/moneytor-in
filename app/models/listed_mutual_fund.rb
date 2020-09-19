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
class ListedMutualFund < ApplicationRecord
  has_many :mutual_funds

  def self.create_by(params)
    ListedMutualFund.create!(name: params[:name])
  end
end
