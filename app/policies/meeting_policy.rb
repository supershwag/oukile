class MeetingPolicy < ApplicationPolicy

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    record.loser == user
    return true
  end

  # def edit?
  #   record.loser == user
  #   return true
  # end

  def destroy?
    record.loser == user
    return true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
