class ItemPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    record.finder == user
  end

  def edit?
    record.finder == user
  end

  def destroy?
    record.finder == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
