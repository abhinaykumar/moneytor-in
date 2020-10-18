class SavingAccountPolicy < ApplicationPolicy
  def modify?
    record.owner?(user.id)
  end
end
