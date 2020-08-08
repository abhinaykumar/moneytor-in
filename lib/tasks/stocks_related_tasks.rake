require 'csv'

namespace :stocks do
  desc 'import Stocks and Symbols'
  task import_stocks_symbols: :environment do
    csv_text = File.read("#{Rails.root}/public/eq.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      ListedStock.create!(
        symbol: row['SYMBOL'],
        name: row['NAME OF COMPANY'],
        date_of_listing: Date.parse(row[' DATE OF LISTING']),
        face_value: row['FACE VALUE']
      )
    end
  end

  task update_current_market_price: :environment do
    begin
      ls = Stock.pluck(:listed_stock_id).uniq
      ListedStock.where(id: ls).each do |s|
        p = NseServices::GetQuote.call(s.symbol)
        s.update! current_market_price: p
      end
    rescue StandardError => e
      puts e
    end
  end
end
