class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      head(:created)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user.update(user_params)
  end

  def destroy
    user.destroy!
  end

  private

    def set_user
      user = User.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      head(:not_found)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
