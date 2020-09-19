class RenameAndAddColumnToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :investment_amount, :float
    rename_column :stocks, :price, :at_price
  end
end
