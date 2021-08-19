class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :new
  before_action :set_bookings, only: :update
  before_action :set_user, only: %i[index new]
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
    @booking.user = current_user
    @booking.doppelganger = @doppelganger
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render 'doppelgangers/show'
    end
  end

  # To be implemented later, don't forget to uncomment the before_action
  # def update
  #   @booking.update(booking_params)
  #   redirect_to owner_bookings_path(@user)
  # end
  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to owner_bookings_path
    else
      render 'doppelgangers/show'
    end
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :location, :status)
  end

  def set_user
    @user = current_user
  end
end
