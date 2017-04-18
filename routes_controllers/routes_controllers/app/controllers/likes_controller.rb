class LikesController < ApplicationController

  def index
    if params[:likeable_type] == 'Comment'
      comment = Comment.find(params[:likeable_id])
      render json: comment.likes
    elsif params[:likeable_type] == 'Artwork'
      artwork = Artwork.find(params[:likeable_id])
      render json: artwork.likes
    end
  end

  def create
    like = Like.new(like_params)

    if like.save
      render json: like
    else
      render json: like.errors.full_messages,
        status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy

    redirect_to likes_url, status: 303
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
  end

end
