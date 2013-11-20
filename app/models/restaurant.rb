class Restaurant < ActiveRecord::Base

  has_many :reservations

  def open_hour
    11
  end

  def close_hour
    20
  end

  def available_hours
    reservation_interval = 1.hour

    opening_time = Time.zone.now + 10.minutes
    opening_time = Time.zone.at((opening_time.to_f/reservation_interval).round * reservation_interval )
    opening_time = [opening_time, opening_time.change(hour: open_hour)].max

    closing_time = (opening_time + 7.days).change(hour: close_hour)

    operating_hours = []
    var_hour = opening_time

    begin

      operating_hours << var_hour

      var_hour += reservation_interval

      if (var_hour + reservation_interval) > var_hour.change(hour: close_hour)
        var_hour = (var_hour + 1.day).change(hour: open_hour)
      end

    end while var_hour < closing_time
    
    operating_hours

  end

  # def is_available?(start_time, guests) 
  #   # debugger
  #   reserved = self.reservations.where(:start_time, start_time).sum(:guests)
  #   self.capacity - (reserved + guests) >= 0
  # end


end
