class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.date :investment_date
      t.float :brokerage
      t.float :price

      t.timestamps
    end
  end
end
