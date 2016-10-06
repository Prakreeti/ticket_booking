class ShowTime < ActiveRecord::Base
	belongs_to :screen
	belongs_to :movie
	has_many :reservations, dependent: :destroy
	has_many :seat_categories, dependent: :destroy
end
