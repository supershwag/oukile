class UserPolicy < ApplicationPolicy

  def show?
    # record.user == user
    true
  end

  def edit?
    # record.user == user
    true
  end

  def update?
    # record.user == user
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
