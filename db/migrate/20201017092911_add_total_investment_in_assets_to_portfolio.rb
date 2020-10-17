class AddTotalInvestmentInAssetsToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :sum_of_investment_in_stocks, :float, default: 0.00
    add_column :portfolios, :sum_of_investment_in_mutual_funds, :float, default: 0.00
    add_column :portfolios, :sum_of_investment_in_saving_accounts, :float, default: 0.00
    add_column :portfolios, :sum_of_investment_in_cryptocurrencies, :float, default: 0.00
  end
end
