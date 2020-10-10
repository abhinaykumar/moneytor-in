class JsonWebToken
  def self.encode(payload = {})
    JWT.encode(payload, Rails.application.credentials[:HMAC_SECRET], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.credentials[:HMAC_SECRET], true, { algorithm: 'HS256' })[0]
  end
end
