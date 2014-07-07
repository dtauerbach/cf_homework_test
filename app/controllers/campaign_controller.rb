class CampaignController < ApplicationController
  before_action :get_campaign
  before_action :require_login, except: [:show]
  before_action :require_auth, only: [:edit, :update, :delete]

  def get_campaign
    @campaign = Campaign.find(params[:id]) if params[:id]
  end

  def require_auth
    unless @current_user && @campaign && (@campaign.user.id == @current_user.id || @current_user.admin?)
      redirect_to "/"
    end
  end

  def new
  end

  def create
    @campaign = Campaign.create({title: params[:title], user_id: @current_user.id})
    redirect_to campaign_path(@campaign.id)
  end

  def show
  end

  def edit
  end

  def update
    case params[:commit]
    when "Apply Changes"
      @campaign.update_data(params[:campaign][:title], params[:user_email])
    when "Update Total"
      @campaign.update_total
    when "Add Perk"
      @campaign.add_perk(params[:perk_title], params[:perk_text], params[:perk_amount])
    end
    render :edit
  end

  def delete
  end

  def new_contribution
    @contribution = @campaign.add_contribution(BigDecimal.new(params[:amount]), @current_user)
  end
end
