class CreateListedCryptocurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :listed_cryptocurrencies do |t|
      t.string :name
      t.string :symbol
      t.float :current_market_price

      t.timestamps
    end
    add_index :listed_cryptocurrencies, :name
  end
end
