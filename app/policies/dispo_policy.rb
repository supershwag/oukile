class DispoPolicy < ApplicationPolicy

  def new?
    record.finder == user
    true
  end

  def create?
    record.finder == user
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
