class SessionsController < ApplicationController

  def create
    if user = User.create_with_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      flash[:success] = "Successfully signed in #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:danger] = "Failed to successfully sign in. :("
      redirect_to
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully signed out!"
    redirect_to root_url
  end
end
