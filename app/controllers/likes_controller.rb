class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.author_id = current_user.id
    @like.save
    redirect_to request.referer
  end

  def destroy
    @like = Like.find_by(like_params)
    @like.destroy
    redirect_to request.referer
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :author_id)
  end
end
