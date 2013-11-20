class RemoveStartTimeFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :start_time, :integer
  end
end
