class AddCmpToListedStock < ActiveRecord::Migration[6.0]
  def change
    add_column :listed_stocks, :current_market_price, :float
  end
end
