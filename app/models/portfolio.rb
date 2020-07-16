class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :stocks

  scope :default, -> { find_by(name: 'default') }
end
