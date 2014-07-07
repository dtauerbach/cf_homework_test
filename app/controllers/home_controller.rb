class HomeController < ApplicationController

  def index
    @top_campaigns = Campaign.limit(5)
  end

  def signin
    current_user = User.login(params[:email])
    session[:current_user_id] = current_user.id
    redirect_to "/"
  end

  def signout
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
