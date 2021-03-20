class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Signed in successfully.'
    else
      flash[:alert] = 'Invalid Username or Password.'
      render :new
    end
  end
end