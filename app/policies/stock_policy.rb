class StockPolicy < ApplicationPolicy
  def modify?
    record.owner?(user.id)
  end
end
