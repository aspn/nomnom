class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :start_time, :numericality => { only_integer: true }
  # validate :restaurant_have_capacity

  # def restaurant_have_capacity
  #   unless self.restaurant.is_available?(self.start_time, self.guests)
  #     errors.add(:start_time, "the restaurant cannot fit" + pluralize(self.guests, "person"))
  #   end
  # end

end
