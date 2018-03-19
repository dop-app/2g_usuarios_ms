class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    p user.id
  end

  def destroy
    session[:user_id] = nil
  end 

end


