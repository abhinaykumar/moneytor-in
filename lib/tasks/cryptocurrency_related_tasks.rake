namespace :cryptocurrencies do
  desc 'import Cryptocurrency and update market price'
  task import_cryptocurrency_symbols: :environment do
    res = HTTParty.get("#{url}?start=1&limit=5000&convert=INR",
      :headers => {
        'Content-Type' => 'application/json',
        'X-CMC_PRO_API_KEY' => Rails.application.credentials[:COIN_MARKET_CAP_API_KEY],
        'Accepts' => 'application/json'
      }
    )

    res['data'].each do |x|
      ListedCryptocurrency.create!(
        name: x['name'],
        symbol: x['symbol'],
        current_market_price: x['quote']['INR']['price']
      )
    end
  end

  task update_current_market_price: :environment do
    begin
      lc = Cryptocurrency.pluck(:listed_cryptocurrency_id).uniq
      res = HTTParty.get("#{url}?start=1&limit=5000&convert=INR",
        :headers => {
          'Content-Type' => 'application/json',
          'X-CMC_PRO_API_KEY' => Rails.application.credentials[:COIN_MARKET_CAP_API_KEY],
          'Accepts' => 'application/json'
        }
      )
      ListedCryptocurrency.where(id: lc).each do |cc|
        crypto = res['data'].each do |x| 
          return x if x['symbol'] == cc.symbol
        end
        cmp = crypto['quote']['INR']['price']

        cc.update! current_market_price: cmp
      end
    rescue StandardError => e
      puts e
    end
  end
end
