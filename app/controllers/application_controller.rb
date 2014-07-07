class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_user

  def load_user
    @current_user = User.find_by_id(session[:current_user_id]) if session[:current_user_id]
    puts "loaded user #{@current_user}"
  end

  def require_login
    redirect_to "/" unless @current_user
  end
end
