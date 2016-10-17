class RemoveReferencesFromSeatSelect < ActiveRecord::Migration
  def change
  	remove_foreign_key :seat_selects, :hall
  	remove_foreign_key :seat_selects, :screen
  	remove_foreign_key :seat_selects, :seat
  end
end
