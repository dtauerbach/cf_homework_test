class UserController < ApplicationController
  before_action :get_display_user
  before_action :require_auth, except: [:show]

  def get_display_user
    @display_user = User.find(params[:id]) if params[:id]
  end

  def require_auth
    unless @current_user && @display_user && (@display_user.id == @current_user.id || @current_user.admin?)
      redirect_to "/"
    end
  end

  def show
  end

  def edit
  end

  def update
    case params[:commit]
    when "Clear Logins"
      @display_user.clear_logins
    when "Apply Changes"
      @display_user.update_data(params[:user][:email])
    end
    render :edit
  end

  def my_info
    redirect_to user_path(@current_user.id)
  end

  def signout
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
