class AddColumnsToSeats < ActiveRecord::Migration
  def change
  	add_column :seats, :row, :integer
  	add_column :seats, :column, :integer
  	add_column :seats, :status, :text
  	add_reference :seats, :screen, index: true, foreign_key: true 
  	add_reference :seats, :seat_category, index: true, foreign_key: true 
  end
end
