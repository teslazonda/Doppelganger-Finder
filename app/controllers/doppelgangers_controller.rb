class DoppelgangersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_doppelganger, only: :show


  def index

#     @doppelgangers = Doppelganger.all
#     endpoint = '/styles/v1/mapbox/streets-v11/static/2.3381,48.8693,10.45,0,0/600x1000'
#     api_key = 'pk.eyJ1IjoidG9reW8tdmlkZHkiLCJhIjoiY2tycHhid2tsMDMxdjJ4bzByMDdxZ2FkNSJ9.C6Sja5RTRv-hA-koGRTofw'
#     @url = "https://api.mapbox.com/#{endpoint}?access_token=#{api_key}"
    # @doppelgangers = Doppelganger.all
    @doppelgangers = policy_scope(Doppelganger).order(created_at: :desc)
  end

  def new
    @doppelganger = Doppelganger.new
    authorize @doppelganger
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

  def show
    @booking = Booking.new
  end

  private

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
    authorize @doppelganger
  end

  def doppelganger_params
    params.require(:doppelganger).permit(:name, :description, :price)
  end
end
