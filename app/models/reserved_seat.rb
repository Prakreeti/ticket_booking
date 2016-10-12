class ReservedSeat < ActiveRecord::Base
	belongs_to :reservation
	validates :reservation_id,  presence: true
	validates :seat_id,  presence: true
end
