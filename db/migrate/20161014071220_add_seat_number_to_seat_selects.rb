class AddSeatNumberToSeatSelects < ActiveRecord::Migration
  def change
  	add_column :seat_selects, :seat_number, :integer
  end
end
