class UsersController < ApplicationController

  skip_before_action :require_not_logged_in, only: [:show]

  def require_not_logged_in
    if current_user
      redirect_to cats_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!
      redirect_to user_url(@user)
    else
      @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
