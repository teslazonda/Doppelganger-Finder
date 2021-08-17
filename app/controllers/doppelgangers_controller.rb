class DoppelgangersController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @doppelgangers = Doppelganger.all
    endpoint = '/styles/v1/mapbox/streets-v11/static/2.3381,48.8693,10.45,0,0/600x1000'
    api_key = 'pk.eyJ1IjoidG9reW8tdmlkZHkiLCJhIjoiY2tycHhid2tsMDMxdjJ4bzByMDdxZ2FkNSJ9.C6Sja5RTRv-hA-koGRTofw'
    @url = "https://api.mapbox.com/#{endpoint}?access_token=#{api_key}"
  end

  def new
    @doppelganger = Doppelganger.new
  end

  def create
    @doppelganger = Doppelganger.new(doppelganger_params)
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
