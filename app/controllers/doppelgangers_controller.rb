class DoppelgangersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_doppelganger, only: :show

  def index
    @doppelgangers = Doppelganger.all
    @markers = @doppelgangers.geocoded.map do |doppelganger|
      {
        lat: doppelganger.latitude,
        lng: doppelganger.longitude,
        info_window: render_to_string(partial: "info_window", locals: { doppelganger: doppelganger })
      }
    end
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
