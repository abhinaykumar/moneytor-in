class AddBranchNameToSavingAcount < ActiveRecord::Migration[6.0]
  def change
    add_column :saving_accounts, :branch_name, :string
  end
end
