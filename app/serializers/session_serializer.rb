class SessionSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  attribute :token do |object|
    JsonWebToken.encode(user_id: object.id, exp: (Time.now + 1.years).to_i)
  end
end
