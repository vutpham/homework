class SessionsController < ApplicationController

  skip_before_action :require_not_logged_in, only: [:destroy]

  def require_not_logged_in
    if current_user
      redirect_to cats_url
    end
  end

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      login_user!
      redirect_to cats_url
    else
      # @user.errors.full_messages
      redirect_to new_sessions_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to cats_url
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
