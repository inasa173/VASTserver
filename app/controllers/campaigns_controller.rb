class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.order(created_at: :DESC).page(params[:page]).per(10)
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(campaign_params)
    
    if @campaign.save
      flash[:success] = 'campaignを登録しました'
      redirect_to @campaign
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @campaign = Campaign.find_by(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      flash[:success] = 'キャンペーンを更新しました'
      redirect_to @campaign
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:success] = "削除しました"
    redirect_to campaign_url
  end
  
  private
  
  def campaign_params
    params.require(:campaign).permit(:id, :name, :start_at, :end_at, :limit_start, :movie_url)
  end
end