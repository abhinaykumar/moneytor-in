class RemoveColumnFromMutualFund < ActiveRecord::Migration[6.0]
  def change
    remove_column :mutual_funds, :investment_type
    remove_column :mutual_funds, :nav
  end
end
