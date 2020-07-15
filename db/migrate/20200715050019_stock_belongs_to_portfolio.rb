class StockBelongsToPortfolio < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks, :portfolios, foreign_key: true
  end
end
