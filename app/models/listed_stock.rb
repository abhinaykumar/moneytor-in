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
class ListedStock < ApplicationRecord
  has_many :stocks
end
