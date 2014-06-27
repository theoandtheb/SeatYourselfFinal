class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validate :availability

private
  def availability
    if !restaurant.available?(party_size, time)
      errors.add(:base, "Restaurant is full. Please choose another time. We may be able to accomodate smaller party sizes.")
    end
  end
end
