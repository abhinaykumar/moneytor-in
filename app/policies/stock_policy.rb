class StockPolicy < ApplicationPolicy
  def update?
    record.owner?(user.id)
  end

  def edit?
    update?
  end

  def destroy?
    record.owner?(user.id)
  end
end
