class RemoveHallScreenSeatFromSeatSelects < ActiveRecord::Migration
  def change
  	remove_reference :seat_selects, :screen, index: true
  	remove_reference :seat_selects, :hall, index: true
  	remove_reference :seat_selects, :seat, index: true
  end
end
