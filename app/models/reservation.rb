class Reservation < ActiveRecord::Base
	belongs_to: showtime
	belongs_to: user
	has_many: reserved_seats, dependent: :destroy
end
