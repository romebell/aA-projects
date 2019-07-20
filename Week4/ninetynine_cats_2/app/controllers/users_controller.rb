class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      login!(@user)
      redirect_to cats_url
    else
      #redirect_to 
      #need to render error msg from flash
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :session_token, :password, :password_digest)
  end
end