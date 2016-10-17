class BlockedSeatsController < ApplicationController
	def create
		@seats_array = []
		params[:seats].each do |seat|
			@seat_selected = BlockedSeat.new(seat_number: seat[:seat].to_i,
																		 show_time_id: seat[:show_time][:id])
			@seat_selected.save
			@seats_array << @seat_selected.id
		end
		BlockedSeatsWorker.perform_in(3.minutes, @seats_array)
		redirect_to :back
	end
end
