class CampaignsController < ApplicationController

  def index
    if params[:cuepoint_id]
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = Campaign.current_avaliable(@cuepoint)
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    else
      @campaigns = Campaign.order(created_at: :DESC).page(params[:page]).per(10)
      #redirect_to edit_cuepoint_path(@cuepoint)
    end
  end
  
  # def show
  #   @campaign = Campaign.find(params[:id])
  # end
  
  def new
    @campaign = Campaign.new
    @cuepoints = Cuepoint.all
  end
  
  def create
    p campaign_params
    @campaign = Campaign.new(campaign_params)
    
    if @campaign.save
      flash[:success] = 'campaignを登録しました'
      redirect_to campaigns_url
    else
      @cuepoints = Cuepoint.all
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
    @cuepoints = Cuepoint.all
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params) || @cuepoint.update(cuepoint_params)
      flash[:success] = 'キャンペーンを更新しました'
      redirect_to campaigns_url
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:success] = "削除しました"
    redirect_to campaigns_url
  end
  
  private
  
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url, cuepoint_ids: [])
  end
end
