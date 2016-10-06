class AddColumnsToReservations < ActiveRecord::Migration
  def change
		add_column :reservations, :number_of_seats, :integer
  	add_reference :reservations, :user, index: true, foreign_key: true 
  	add_reference :reservations, :show_time, index: true, foreign_key: true 		
  end
end
