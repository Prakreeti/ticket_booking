class ShowTime < ActiveRecord::Base
	belongs_to :screen
	belongs_to :movie
	has_many :reservations, dependent: :destroy
	has_many :seat_categories, dependent: :destroy
	has_one :hall, through: :screen

	validates :date,  presence: true
	validates :time,  presence: true
	validates :screen_id,  presence: true
	validates :movie_id,  presence: true

	def get_movie_name
		self.movie.title
	end

	def get_hall
		self.hall.id
	end

	def get_screen
		self.screen.id
	end

	def get_time
		self.time
	end
end
