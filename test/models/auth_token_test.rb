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
require 'test_helper'

class AuthTokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
