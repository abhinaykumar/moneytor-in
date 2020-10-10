class CreateCryptocurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptocurrencies do |t|
      t.float :at_price
      t.float :investment_amount
      t.date :investment_date
      t.float :quantity
      t.references :listed_cryptocurrency, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
