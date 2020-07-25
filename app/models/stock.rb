class Stock < ApplicationRecord
  belongs_to :portfolio
  belongs_to :listed_stock

  def self.sum_of_investment
    sum(:price)
  end
end
