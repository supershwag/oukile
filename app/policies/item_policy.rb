class ItemPolicy < ApplicationPolicy

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    record.finder == user
    return true
  end

  def edit?
    record.finder == user
    return true
  end

  def destroy?
    record.finder == user
    return true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
