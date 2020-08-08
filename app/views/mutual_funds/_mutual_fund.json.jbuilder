json.extract! mutual_fund, :id, :name, :investment_type, :date_of_investment, :units, :investment_amount, :portfolio_id, :created_at, :updated_at
json.url mutual_fund_url(mutual_fund, format: :json)
