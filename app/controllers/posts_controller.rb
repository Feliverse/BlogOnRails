class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
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
  
  
  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
