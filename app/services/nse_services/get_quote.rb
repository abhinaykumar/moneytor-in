module NseServices
  class GetQuote < NseServices::Base
    BASE_URL = 'https://www.nseindia.com/api/quote-equity?symbol='.freeze

    def initialize(symbol)
      # TODO: check for cached data for this SYMBOL
      @uri = "#{BASE_URL}#{symbol}"
      @headers = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36',
        'origin' => 'www.nseindia.com',
        'referer' => 'https://www.nseindia.com'
      }
    end

    def call
      res = HTTParty.get(@uri, headers: @headers)
      res['priceInfo']['lastPrice']
    end
  end
end
