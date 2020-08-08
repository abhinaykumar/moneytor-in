class UpdateCoumnNameToMutualFund < ActiveRecord::Migration[6.0]
  def change
    rename_column :mutual_funds, :current_nav, :nav
  end
end
