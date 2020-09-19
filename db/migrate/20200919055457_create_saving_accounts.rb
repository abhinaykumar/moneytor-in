class CreateSavingAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :saving_accounts do |t|
      t.float :amount_saved
      t.float :rate_of_interest
      t.references :listed_bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
