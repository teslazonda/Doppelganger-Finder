class DoppelgangersController < ApplicationController
  before_action :set_restaurant, only: :show


  def index
    # @doppelgangers = Doppelganger.all
    @doppelgangers = policy_scope(Doppelganger).order(created_at: :desc)
  end

  def new
    @doppelganger = Doppelganger.new
  end

  def create
    @doppelganger = Doppelganger.new(doppelganger_params)
    authorize @doppelganger
    if @doppelganger.save
      redirect_to doppelganger_path(@doppelganger)
    else
      render :new
    end
  end

  def show; end

  private

  def set_doppelgangers
    @doppelganger = Doppelganger.find(params[:id])
  end

  def doppelganger_params
    params.require(:doppelganger).permit(:name, :description, :price)
  end
end
