class MutualFundPolicy < ApplicationPolicy
  def modify?
    record.owner?(user.id)
  end
end
