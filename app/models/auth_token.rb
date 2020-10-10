# == Schema Information
#
# Table name: auth_tokens
#
#  id         :bigint           not null, primary key
#  aud        :string
#  jti        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_auth_tokens_on_aud      (aud)
#  index_auth_tokens_on_jti      (jti) UNIQUE
#  index_auth_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class AuthToken < ApplicationRecord
  validates :jti, presence: true, uniqueness: true
  validates :aud, presence: true

  belongs_to :user

  def self.revoked?(user: nil, jti: nil)
    !user.auth_tokens.exists?(jti: jti)
  end

  def self.generate_uniq_jti
    loop do
      jti_raw = [ENV['HMAC_SECRET'], Time.current.to_i].join(':').to_s
      jti = Digest::MD5.hexdigest(jti_raw)
      break jti unless exists?(jti: jti)
    end
  end
end
