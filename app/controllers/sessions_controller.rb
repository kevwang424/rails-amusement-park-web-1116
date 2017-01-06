class SessionsController < ApplicationController

  def new
  end

  def create
    # take in params
    if @user = User.find_by(name: params[:user][:name]).authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
