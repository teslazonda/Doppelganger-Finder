class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings
      # user.bookings_as_renter (if above doesnt work)
    end
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def update?
    # record.user == user
    # record.user == @doppelganger.user
    record.doppelganger.user == user
  end

  def destroy?
    record.user == user
  end
end
