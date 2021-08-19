class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      render 'owner/bookings'
    else
      render 'doppelgangers/show'
    end
  end

  private

  def booking_params
    # TODO: check your model, might be different than mine
    params.require(:booking).permit(:status, :start_time, :end_time)
  end
end
