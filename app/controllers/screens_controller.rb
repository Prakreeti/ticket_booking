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
		@screen = Screen.find_by(id: params[:id])
		@seats = @screen.seats
		@seat_categories = SeatCategory.all
		seats_for_the_screen
	end
	
	private

	def screen_params
    params.require(:screen).permit(:total_seats, :total_rows, :total_columns)
  end

  def seats_for_the_screen
  	@seat_collection = []
  	(1..@screen.total_rows).each do |row|
  		(1..@screen.total_columns).each do |column|
  			@seat_collection << {row: row, column: column} if Seat.where(row: row, column: column).exists?
  		end
  	end
  end
end
