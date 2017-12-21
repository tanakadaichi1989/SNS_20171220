class LikesController < ApplicationController

  before_action :authenticate_user

  def like
    @like = Like.new(user_id: @current_user.id,post_id: params[:post_id])

    if @like.save
      redirect_to "/posts/#{params[:post_id]}"
    end
  end

  def dislike
     @like = Like.find_by(user_id: @current_user.id,post_id: params[:post_id])

      if @like.destroy
      redirect_to "/posts/#{params[:post_id]}"
    end
  end
end