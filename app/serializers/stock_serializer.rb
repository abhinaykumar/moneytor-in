class StockSerializer < ApplicationSerializer
  include JSONAPI::Serializer
  attributes :at_price, :investment_amount
end
