class StocksBelongsToListedStock < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks, :listed_stock, foreign_key: true
  end
end
