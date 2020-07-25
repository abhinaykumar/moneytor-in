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
end
