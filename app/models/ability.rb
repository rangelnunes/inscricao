class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :Admin
      can :manage, :all
    elsif user.role? :Moderator
      can :read, [Palestra, Palestrante]
      can [:edit, :update], Minicurso
    elsif user.role? :Member
       can :read, :all
       can :create, [Palestra, Palestrante]
       can [:edit, :update], Minicurso
    end
  end
end
