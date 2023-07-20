class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params['id'])
  end

  def new
    @user = User.new
  end

  def CreatePosts
    @user = User.find_by(id: params['id'])
    @post = Post.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  def edit
    @user = User.find_by(id: params['id'])
  end

  def update
    @user = User.find_by(id: params['id'])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user = User.find_by(id: params['id'])
    @user.destroy
    redirect_to users_path
  end

end
