class RemoveSeatFromSeatPricing < ActiveRecord::Migration
  def change
  	remove_reference :seat_pricings, :seat, index: true
  end
end
