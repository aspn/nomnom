class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :guests, :numericality => { only_integer: true }
  validate :capacity_checker
  # validate :restaurant_have_capacity

  # def restaurant_have_capacity
  #   unless self.restaurant.is_available?(self.start_time, self.guests)
  #     errors.add(:start_time, "the restaurant cannot fit" + pluralize(self.guests, "person"))
  #   end
  # end

  def guest_counter
    total_guests = 0

    restaurant.reservations.each do |r|
      if r.start_time == start_time
        total_guests += r.guests
      end
    end
    total_guests
  end

  def capacity_checker
    if (guest_counter + guests > restaurant.capacity)
      errors.add(:reservation, "Unfortunately, #{restaurant.name} is all full")
    end
  end

end
