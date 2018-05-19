class UsersController < ApplicationController
  #before_action :authenticate_user, only: [:destroy, :edit, :current, :update]
  before_action :set_user, only: [:show, :update, :destroy]

  
  def index
    @users = User.all
    @user= User.first
    if User.exists?(:id => 1)
      user = User.first
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      render json: @users, status: :ok
      #render json: {usuarios: @users, token: token}, status: :ok
    else
      render json: @users, status: :ok
    end
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

def validation
    token = params[:token]
    decoded_token = JWT.decode token, nil, false
    fa = decoded_token[0]["sub"]
    id= params[:idsession]
    if fa == id
      render json: true
    else
      render json: false
    end    
  end

private
def user_params
  params.require(:user).permit(:name, :age, :gender, :picture, :avatar,:email,:password,:password_confirmation,:token,:idsession)
end

# Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
