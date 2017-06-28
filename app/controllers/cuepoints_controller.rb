class CuepointsController < ApplicationController
  before_action :set_cuepoint, only: [:show, :edit, :update, :destroy]

  def index
    @cuepoints = Cuepoint.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @cuepoint = Cuepoint.new
  end

  def create
    @cuepoint = Cuepoint.new(cuepoint_params)

    if @cuepoint.save
      flash[:success] = 'Cuepoint が正常に投稿されました'
      redirect_to @cuepoint
    else
      flash.now[:danger] = 'Cuepoint が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @cuepoint.update(cuepoint_params)
      flash[:success] = 'Cuepoint は正常に更新されました'
      redirect_to @cuepoint
    else
      flash.now[:danger] = 'Cuepoint は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @cuepoint.destroy

    flash[:success] = 'Cuepoint は正常に削除されました'
    redirect_to cuepoints_url
  end

  # def _cuepoints_name
  #   @cuepoint = Cuepoint.new
  # @cuepoints = Cuepoint.select(:name).distinct
  # end

  private

  def set_cuepoint
    @cuepoint = Cuepoint.find(params[:id])
  end

  def cuepoint_params
    params.require(:cuepoint).permit(:id, :name)
  end
end
