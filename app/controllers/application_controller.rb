class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_list
    @list = List.first #TODO Change to listID
  end
end
