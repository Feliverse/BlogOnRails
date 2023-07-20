class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find_by(id: params['id'])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def edit
    @post = Post.find_by(id: params['id'])
  end

  def update
    @post = Post.find_by(id: params['id'])
    @post.update(post_params)
    redirect_to user_posts_path(@post.user)
  end

  def destroy
    @post = Post.find_by(id: params['id'])
    @post.destroy
    redirect_to user_posts_path(@post.user)
  end

  def like
    @post = Post.find_by(id: params['id'])
    @post.likes.create(user_id: current_user.id)
    redirect_to user_posts_path(@post.user)
  end

  def unlike
    @post = Post.find_by(id: params['id'])
    @post.likes.where(user_id: current_user.id).destroy_all
    redirect_to user_posts_path(@post.user)
  end

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
