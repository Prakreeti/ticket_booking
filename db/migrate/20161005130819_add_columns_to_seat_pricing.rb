class AddColumnsToSeatPricing < ActiveRecord::Migration
  def change
  	add_column :seat_pricings, :price, :integer
  	add_reference :seat_pricings, :seat, index: true, foreign_key: true
  	add_reference :seat_pricings, :show_time, index: true, foreign_key: true
  	add_reference :seat_pricings, :seat_category, index: true, foreign_key: true 
  end
end
