class AddNavPriceToMutualFund < ActiveRecord::Migration[6.0]
  def change
    add_column :mutual_funds, :at_nav, :float
  end
end
