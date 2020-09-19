class AddForeignKeyToMutualFund < ActiveRecord::Migration[6.0]
  def change
    add_reference :mutual_funds, :listed_mutual_fund, null: false, foreign_key: true
  end
end
