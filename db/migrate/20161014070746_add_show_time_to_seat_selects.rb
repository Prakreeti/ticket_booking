class AddShowTimeToSeatSelects < ActiveRecord::Migration
  def change
  	add_reference :seat_selects, :show_time, index: true, foreign_key: true
  end
end
