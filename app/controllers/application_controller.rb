class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def set_list
    #@list = List.find(params[:list_id])
    @list = List.find_by(user_id: current_user.id) || List.create(user_id: current_user.id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    access_denied unless logged_in?
  end

  def access_denied
    flash[:error] = "You must be logged in to do that"
    redirect_to root_path
  end
end
