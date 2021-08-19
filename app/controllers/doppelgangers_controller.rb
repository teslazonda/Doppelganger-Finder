class DoppelgangersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_doppelganger, only: :show
  before_action :doppelganger_index, only: :index

  def index
    @markers = @doppelgangers.geocoded.map do |doppelganger|
      {
        lat: doppelganger.latitude,
        lng: doppelganger.longitude,
        info_window: render_to_string(partial: "info_window", locals: { doppelganger: doppelganger })
      }
    end
    @doppelgangers = policy_scope(doppelganger_index).order(created_at: :desc)
    # @name = search_name
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

  # def search_name
  #   'all' if params[:query].blank?
  # end

  def doppelganger_index
    @doppelgangers =
      if params[:query].blank?
        Doppelganger.all
      else
        Doppelganger.search_by_name_and_description(params[:query])
      end
  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
    authorize @doppelganger
  end

  def doppelganger_params
    params.require(:doppelganger).permit(:name, :description, :price)
  end
end
