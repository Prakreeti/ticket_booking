class Movie < ActiveRecord::Base
	has_many :show_times, dependent: :destroy
end
