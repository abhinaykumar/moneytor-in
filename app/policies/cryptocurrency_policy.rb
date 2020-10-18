class CryptocurrencyPolicy < ApplicationPolicy
  def modify?
    record.owner?(user.id)
  end
end
