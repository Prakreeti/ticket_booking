class AddColumnsToSeatSelect < ActiveRecord::Migration
  def change
  	add_reference :seat_selects, :user, index: true, foreign_key: true
  	add_reference :seat_selects, :hall, index: true, foreign_key: true
  	add_reference :seat_selects, :screen, index: true, foreign_key: true
  	add_reference :seat_selects, :seat, index: true, foreign_key: true
  end
end
