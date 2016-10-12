class SeatsController < ApplicationController
	
	def create
		@seat = Seat.new(seat_params)
		@seat.save
		redirect_to :back
	end
	
	private
	
	def seat_params
    params.require(:seat).permit(:row, :column, :screen_id, :seat_category_id)
  end
end
