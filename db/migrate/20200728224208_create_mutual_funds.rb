class CreateMutualFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :mutual_funds do |t|
      t.string :name
      t.string :invetment_type
      t.date :date_of_invetment
      t.float :units
      t.float :invetment_amount
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
