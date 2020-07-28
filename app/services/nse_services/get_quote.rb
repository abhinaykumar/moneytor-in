# module NseServices
#   class GetQuote < NseServices::Base
#     BASE_URL = 'https://www.nseindia.com/api/quote-equity?symbol='

#     def initialize(symbol)
#       # TODO: check for cached data for this SYMBOL
#       @uri = URI("#{BASE_URL}#{symbol}")
#     end

#     def call
#       # post receiving the data, save it to a temp. storage like REDIS.
#       res = Net::HTTP.get @uri
#       res['priceInfo']['lastPrice']
#     end
#   end
# end

# # headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36", "origin": "
# # www.nseindia.com" }
# #  HTTParty.get("https://www.nseindia.com/api/quote-equity?symbol=COALINDIA", headers: headers, debug_output: $stdout)