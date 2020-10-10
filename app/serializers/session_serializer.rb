class SessionSerializer < ApplicationSerializer
  include JSONAPI::Serializer
  attributes :email

  attribute :token do |object|
    jti = AuthToken.generate_uniq_jti
    aud = 'desktop'
    AuthToken.create!(jti: jti, aud: aud, user: object)

    JsonWebToken.encode(user_id: object.id, exp: (Time.now + 1.years).to_i, jti: jti, aud: aud)
  end
end
