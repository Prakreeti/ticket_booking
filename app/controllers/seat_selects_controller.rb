class SeatSelectsController < ApplicationController
	before_action :fetch_params, only:[:index]

	def index
		@seats_selected = params[:seats]
		@total_rows = params[:total_rows]
		@total_columns = params[:total_columns]
		@show_time = params[:show_time]
		@show_time_id =  @show_time[:id].to_i
		assign_seat_categories
		respond_to do |format|
			format.js
		end
	end

	private

  def fetch_params
    params[:total_rows] = params[:total_rows].to_i
    params[:total_columns] = params[:total_columns].to_i
    params[:show_time] = params[:show_time]  
  end

  def assign_seat_categories
  	@seat_categories = SeatCategory.all
  	@seat_details = []
  	@total_price = 0
		@seats_selected.each do |seat|
			seat = seat.to_i
			row = ((seat - 1) % @total_rows) + 1
			column = ((seat - row) / @total_rows) + 1
			@seat_categories.each do |category|
				if column.between?(category.starting_row, category.ending_row)
					price = SeatPricing.find_by(seat_category: category, show_time_id: @show_time_id)
					each_seat = {seat: seat, category: category.seat_type, price: price.price, show_time: @show_time}
					@total_price = @total_price + each_seat[:price]
					@seat_details << each_seat
					break
				end
			end
		end
  end
end
