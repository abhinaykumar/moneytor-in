class CreateListedStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :listed_stocks do |t|
      t.string :symbol
      t.string :name
      t.string :listed_on
      t.date :date_of_listing
      t.integer :face_value

      t.timestamps
    end
  end
end
