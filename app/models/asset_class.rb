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
  after_create :add_asset_to_portfolio
  after_destroy :remove_asset_from_portfolio

  private

  def set_internal_name
    self.internal_name = name.tableize
  end

  def add_asset_to_portfolio
    DbServices::Portfolio.add_sum_of_investment_column(
      'portfolios',
      "sum_of_investment_in_#{name.tableize}",
      'float'
    )
  end

  def remove_asset_from_portfolio
    DbServices::Portfolio.remove_sum_of_investment_column(
      'portfolios',
      "sum_of_investment_in_#{name.tableize}"
    )
  end
end
