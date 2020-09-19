class CreateListedBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :listed_banks do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
