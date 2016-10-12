class Reservation < ActiveRecord::Base
	belongs_to: showtime
	belongs_to: user
	has_many: reserved_seats, dependent: :destroy

	validates :number_of_seats,  presence: true
	validates :user_id,  presence: true
	validates :show_time_id,  presence: true
end
