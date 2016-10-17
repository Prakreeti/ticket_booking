class RemoveColumnsFromBlockedSeats < ActiveRecord::Migration
  def change
  	remove_reference :blocked_seats, :screen, index: true
  	remove_reference :blocked_seats, :hall, index: true
  	remove_reference :blocked_seats, :seat, index: true
  end
end
