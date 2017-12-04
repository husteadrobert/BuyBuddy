class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    password = params[:password]
    if user && user.authenticate(password)
      session[:user_id] = user.id
      set_list
      flash[:notice] = "You have logged in"
      redirect_to list_items_path(@list)
    else
      flash[:error] = "There was a problem with your username/password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

  def welcome
  end
end