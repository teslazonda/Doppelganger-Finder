class BookingsController < ApplicationController
  # before_action :set_bookings, only: :update
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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
