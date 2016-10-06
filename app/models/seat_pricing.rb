class SeatPricing < ActiveRecord::Base
	belongs_to :seat_category
	belongs_to :show_time
end
