module ValueResearchServices
  class GetMutualFunds < ValueResearchServices::Base
    BASE_URL = 'https://search.valueresearchonline.com/api/autocomplete-funds-top-navigation/?term='.freeze

    def initialize(term)
      # TODO: check for cached data for this SYMBOL
      @uri = "#{BASE_URL}#{term}"
      @headers = {
        'authority' => 'search.valueresearchonline.com',
        'origin' => 'https://www.valueresearchonline.com',
        'referer' => 'https://www.valueresearchonline.com/',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36'
      }
    end

    def call
      HTTParty.get(@uri, headers: @headers).parsed_response
    end
  end
end