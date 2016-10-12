class AddColumnsToBlockedSeats < ActiveRecord::Migration
  def change
  	add_reference :blocked_seats, :user, index: true, foreign_key: true
  	add_reference :blocked_seats, :hall, index: true, foreign_key: true
  	add_reference :blocked_seats, :screen, index: true, foreign_key: true
  	add_reference :blocked_seats, :seat, index: true, foreign_key: true
  end
end
