class ItemPolicy < ApplicationPolicy

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    return true
  end

  def edit?
    return true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
