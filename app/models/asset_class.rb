# Class to  return All possible AssetClass such as Stock, Cash, Realt estate etc.
class AssetClass < ApplicationRecord
  validates :name, presence: true
  after_validation :set_internal_name

  private

  def set_internal_name
    self.internal_name = name.pluralize.parameterize(separator: '_')
  end
end
