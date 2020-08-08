# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_portfolios_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :stocks
  has_many :mutual_funds

  scope :default, -> { find_by(name: 'default') }
end
