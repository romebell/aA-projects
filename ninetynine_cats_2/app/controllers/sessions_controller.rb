class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentionals(params[:user][:username], params[:user][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session[:session_token]
      redirect_to cats_url
    else
      render :new
    end
  end
end