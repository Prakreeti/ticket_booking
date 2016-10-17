class RemoveForeignKeysFromBlockedSeats < ActiveRecord::Migration
  def change
  	remove_foreign_key :blocked_seats, :seat
  end
end
