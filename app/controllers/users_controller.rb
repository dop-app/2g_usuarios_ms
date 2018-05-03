class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :create, :new, :destroy, :edit, :current, :update]
  before_action :set_user, only: [:show, :update, :destroy]

  
  def index
    @users = User.all
    render json: @users, status: :ok    
  end

  def show
    render json: @user, status: :ok
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user, status: :created
  end

  def destroy
    @user.destroy
  end

  def current
    render json: current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

private
def user_params
  params.require(:user).permit(:name, :age, :gender, :picture, :avatar,:email,:password,:password_confirmation)
end

# Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
