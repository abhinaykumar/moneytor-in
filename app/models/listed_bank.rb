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
class ListedBank < ApplicationRecord
  has_many :saving_accounts
end
