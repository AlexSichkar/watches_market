class WatchPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def index?
    true
  end

  def show?
    true
    # user.admin? || user.present? if user
  end

  def search?
    true
  end

  def find?
    true
  end

  def sort?
    true
  end

  def create?
    user.admin? || user.present? if user
  end

  def update?
    # super
    user.admin? || user.present? if user
  end

  def destroy?
    user.admin? || user.present? if user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end