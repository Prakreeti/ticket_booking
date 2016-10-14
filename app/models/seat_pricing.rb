class SeatPricing < ActiveRecord::Base
	belongs_to :seat_category
	belongs_to :show_time
	validates :price,  presence: true, numericality: { only_integer: true }
	validates :show_time_id,  presence: true
	validates :seat_category_id,  presence: true
end
