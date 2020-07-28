json.extract! mutual_fund, :id, :name, :invetment_type, :date_of_invetment, :units, :invetment_amount, :portfolio_id, :created_at, :updated_at
json.url mutual_fund_url(mutual_fund, format: :json)
