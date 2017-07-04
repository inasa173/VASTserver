class ResultsController < ApplicationController
  def index
    @results = Result.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def record
    #TODO

    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
      type: 'image/gif', disposition: 'inline')
  end
end
