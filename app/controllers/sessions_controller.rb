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
    user = User.find_by(email: auth[:info][:email])
    if !user
      user = User.create(email: auth[:info][:email], password: SecureRandom.hex(20))
    end
    
    user.first_name = auth[:info][:first_name] unless user.first_name
    user.last_name = auth[:info][:last_name] unless user.last_name
    user.google_uid = auth[:uid]

    if user && user.save
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
