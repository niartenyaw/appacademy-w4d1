class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.shared_artworks + user.artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update!(artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy

    redirect_to artworks_url, status: 303
  end



  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
