class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def create_from_google
    user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      u.first_name = auth[:info][:first_name] unless u.first_name
      u.last_name = auth[:info][:last_name] unless u.last_name
      u.google_uid = auth[:uid]
    end

    if user
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Could not log you in'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
