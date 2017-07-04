class ResultsController < ApplicationController
  
  def index
    #@campaign_id = Campaign.id
    @results = Result.all.order(:cuepoint_id, :campaign_id).page(params[:page]).per(10)
  end

  def record
    #TODO
    @campaign = Campaign.find(params[:campaign])
    @cuepoint = Cuepoint.find(params[:cuepoint])
    @result = Result.find_or_initialize_by(campaign: @campaign, cuepoint: @cuepoint)
     logger.debug @result.inspect
    @result.count_start = 0 if @result.count_start.nil?
    @result.count_complete = 0 if @result.count_complete.nil?
    if params[:event] == 'start'
      @result.count_start += 1
    elsif params[:event] == 'complete'
      @result.count_complete += 1
    end
    @result.save!

    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
