# Class to  return All possible AssetClass such as Stock, Cash, Realt estate etc.
class AssetClass < ApplicationRecord
  def internal_name
    name.downcase.strip.split(' ').join('_')
  end
end
