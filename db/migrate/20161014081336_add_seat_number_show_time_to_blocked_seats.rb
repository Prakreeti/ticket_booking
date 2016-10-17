class AddSeatNumberShowTimeToBlockedSeats < ActiveRecord::Migration
  def change
  	add_reference :blocked_seats, :show_time, index: true, foreign_key: true
  	add_column :blocked_seats, :seat_number, :integer
  end
end
