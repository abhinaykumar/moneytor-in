class JsonWebToken
  def self.encode(payload = {})
    private_key ||= Rails.application.credentials.rsa_private_key
    JWT.encode(payload, initialize_key(private_key), 'RS256')
  end

  def self.decode(token)
    public_key ||= Rails.application.credentials.rsa_public_key
    JWT.decode(token, initialize_key(public_key), true, algorithm: 'RS256')[0]
  end

  def self.initialize_key(key)
    OpenSSL::PKey::RSA.new key
  end
end
