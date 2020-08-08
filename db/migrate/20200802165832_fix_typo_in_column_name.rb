class FixTypoInColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :mutual_funds, :date_of_invetment, :date_of_investment
    rename_column :mutual_funds, :invetment_amount, :investment_amount
    rename_column :mutual_funds, :invetment_type, :investment_type
  end
end
