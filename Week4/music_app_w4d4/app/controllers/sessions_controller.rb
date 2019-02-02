class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    def new
       render :new
    end

    def create
      email = params[:user][:email]
      pw = params[:user][:password]
      user = User.find_by(email, pw)

      if user
        login!(user)
        redirect_to user_url(user)
      else
        flash.now[:errors] = ["Invalid credentials"]
        render :new
      end
    end

    def destroy
      logout!
      redirect_to new_session_url
    end
end