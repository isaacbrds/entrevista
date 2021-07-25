# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    if user.role == "admin"  
      can :manage, :all 
    else
      can :read, :all
      can :manage, user
    end
  end
end
