class Seat < ActiveRecord::Base
	belongs_to :screen
	belongs_to :seat_category
	validates :row,  presence: true, numericality: { only_integer: true }
	validates :column,  presence: true, numericality: { only_integer: true }
	validates :screen_id,  presence: true
	validates :seat_category_id,  presence: true
end
