class BlockedSeatsWorker
  include Sidekiq::Worker

  def perform(seat_selected)
  	seat_selected.each do |seat|
			@seat_selected = BlockedSeat.find_by(id: seat)
  		@seat_selected.destroy
  	end
  end
end