class UsersController < ApplicationController
  before_action :authenticate_user, only: [:current,:create,:index,:show,:update,:destroy]
  before_action :set_user, only: [:show,:update,:destroy]
  def index
    @users = User.all()
    render json: @users
  end
  def show
    render json: @user
  end
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :create, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @user.destroy
  end
  def current
    render json: current_user
  end
  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.permit(:username, :email, :name, :age, :gender, :picture, :password, :password_confirmation)
  end
end
