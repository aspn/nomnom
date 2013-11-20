class AddStartTimetoReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start_time, :datetime
  end
end
