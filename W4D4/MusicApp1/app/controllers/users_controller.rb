class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      @user.log_in #build log_in method later

      redirect_to user_url(@url)

    else
      @user.errors.full_messages
      flash[:errors] = "Invalid Email or Password"

      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
