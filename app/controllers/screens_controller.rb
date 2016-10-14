class ScreensController < ApplicationController
	
	def new
		@screen = Screen.new
	end
	
	def create
		@screen = Screen.new(screen_params)
		@screen.save
		redirect_to screens_path
	end
	
	def index
		@screens = Screen.all
	end
	
	def show
		@screen = Screen.find_by(id: params[:id])
		@seat_categories = SeatCategory.all
	end

	def fetch_layout_for
		@showtime = ShowTime.find_by(id: params[:id])
		@screen = Screen.find_by(id: @showtime.screen_id)
		gon.rows = @screen.total_rows
		gon.columns = @screen.total_columns
		gon.showtime = @showtime
	end
	
	private

	def screen_params
    params.require(:screen).permit(:total_seats, :total_rows, :total_columns)
  end
end
