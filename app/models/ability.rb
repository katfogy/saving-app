# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can :read, Account, user_id: user.id
    end
    can :manage, :all if user.role=="admin"
  end
end
