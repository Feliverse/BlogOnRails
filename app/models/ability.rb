# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :create, User

    return unless user.present?

    can :manage, Post, author: user
    can :manage, Comment, user_id: user.id
    can :manage, Like, user_id: user.id

    return unless user.is?('admin')

    can :manage, :all
  end
end