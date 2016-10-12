class Movie < ActiveRecord::Base
	has_many :show_times, dependent: :destroy
	validates :title,  presence: true
	validates :director,  presence: true
	validates :duration,  presence: true
end
