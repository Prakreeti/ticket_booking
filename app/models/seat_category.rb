class SeatCategory < ActiveRecord::Base
	has_many :seats
	has_many :seat_pricings
end
