class UsersController < ApplicationController

 
def index
    @users = User.all    
  end
 def show
    @user = User.find(params[:id])
    p @user.name
 end

def edit
    @user = User.find(params[:id])
  end
 
  # PUT method for updating in database a product based on id
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
def product_params
    params.require(:user).permit(:name, :age, :gender, :picture, :avatar)
  end
end
