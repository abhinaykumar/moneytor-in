class SetDefaultRateToSavingAccount < ActiveRecord::Migration[6.0]
  def change
    change_column :saving_accounts, :rate_of_interest, :float, default: 0.00
  end
end
