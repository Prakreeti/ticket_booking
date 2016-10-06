class AddColumnsToReservedSeats < ActiveRecord::Migration
  def change
  	add_reference :reserved_seats, :reservation, index: true, foreign_key: true
  	add_reference :reserved_seats, :seat, index: true, foreign_key: true
  end
end
