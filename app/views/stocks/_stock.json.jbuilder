json.extract! stock, :id, :name, :investment_date, :brokerage, :price, :created_at, :updated_at
json.url stock_url(stock, format: :json)
