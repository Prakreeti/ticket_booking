class SeatCategoriesController < ApplicationController
	
	def new
		@seat_category = SeatCategory.new
	end
	
	def create
		@seat_category = SeatCategory.new(seat_category_params)
		@seat_category.save
		redirect_to seat_categories_path
	end

	def index
		@seat_categories = SeatCategory.all
	end

	private
	def seat_category_params
		params.require(:seat_category).permit(:seat_type, :starting_row, :ending_row)
	end
end
