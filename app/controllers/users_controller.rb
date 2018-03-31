class UsersController < ApplicationController

 
def index
  @users = User.all
  render json: @users, status: :ok    
end

def show
    @user = User.find(params[:id])
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
  @user = User.where(id: params[:id]).first
  if @user.destroy
     head(:ok)
  else 
     head(:unprocessable_entity) 
  end
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
    params.require(:user).permit(:name, :age, :gender, :picture, :avatar,:email)
  end
end
