class CreateMutualFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :mutual_funds do |t|
      t.string :name
      t.string :investment_type
      t.date :date_of_investment
      t.float :units
      t.float :investment_amount
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
