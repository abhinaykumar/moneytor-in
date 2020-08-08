class AddNavToMutualFund < ActiveRecord::Migration[6.0]
  def change
    add_column :mutual_funds, :current_nav, :float
  end
end
