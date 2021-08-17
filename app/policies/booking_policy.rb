class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # user.bookings_as_renter (if above doesnt work)
    end
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
