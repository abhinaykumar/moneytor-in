class AddPortfolioToSavingAccount < ActiveRecord::Migration[6.0]
  def change
    add_reference :saving_accounts, :portfolio, null: false, foreign_key: true
  end
end
