class AddIndexToModel < ActiveRecord::Migration[6.0]
  def change
    add_index :listed_mutual_funds, :name
    add_index :listed_stocks, :name
    add_index :listed_banks, :name
  end
end
