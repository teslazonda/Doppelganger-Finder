class BookingsController < ApplicationController
  # before_action :set_bookings, only: :update
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
    @booking.user = current_user
    @booking.doppelganger = @doppelganger
    authorize @booking
    if @booking.save
      redirect_to doppelganger_path(@doppelganger)
    else
      render :new
    end
  end

  # To be implemented later, don't forget to uncomment the before_action
  # def update
  #   @booking.update(booking_params)
  #   redirect_to user_path(@user)
  # end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :description, :price)
  end
end
