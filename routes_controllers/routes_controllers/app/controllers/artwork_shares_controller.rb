class ArtworkSharesController < ApplicationController

  def index
    render json: ArtworkShare.all
  end

  def create
    awshare = ArtworkShare.new(artwork_share_params)
    if awshare.save
      render json: awshare
    else
      render(
      json: awshare.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    awshare = ArtworkShare.find(params[:id])
    awshare.destroy

    redirect_to artwork_shares_url, status: 303
  end


  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end
