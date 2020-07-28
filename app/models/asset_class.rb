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
class AssetClass < ApplicationRecord
  validates :name, presence: true
  after_validation :set_internal_name

  private

  def set_internal_name
    self.internal_name = name.pluralize.parameterize(separator: '_')
  end
end
