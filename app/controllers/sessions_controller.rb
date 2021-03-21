class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'Signed in successfully.'
    else
      flash[:alert] = 'Invalid Username or Password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully Signed Out.'
  end
end