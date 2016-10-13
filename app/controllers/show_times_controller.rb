class ShowTimesController < ApplicationController
	
	def fetch
		@showtimes = ShowTime.where(movie: params[:id])
		show_times_collection
	end

	private

	def show_times_collection
		@showtimes_collection = []
    @showtimes.each do |showtime|
      each_showtime = { movie_name: showtime.get_movie_name,
      							    time: showtime.get_time,
      							    hall: showtime.get_hall,
          							screen: showtime.get_screen}
      @showtimes_collection << each_showtime
    end
	end
	
end
