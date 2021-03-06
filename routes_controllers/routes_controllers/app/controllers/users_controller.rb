class UsersController < ApplicationController

  def index
    if params[:user_search]
      render json: User.where("username LIKE ?", "%#{params[:user_search]}%")
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_url, status: 303
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
