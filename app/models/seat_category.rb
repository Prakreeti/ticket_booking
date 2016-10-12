class SeatCategory < ActiveRecord::Base
	has_many :seats
	has_many :seat_pricings
	validates :seat_type,  presence: true
	validates :starting_row, presence: true,
	                         numericality: { only_integer: true }
	validates :ending_row, presence: true,
														 numericality: { only_integer: true }
end
