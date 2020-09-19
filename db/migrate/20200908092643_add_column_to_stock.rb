class AddColumnToStock < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :brokerage
    add_column :stocks, :quantity, :integer
  end
end
