class AddStartRowToSeatCategory < ActiveRecord::Migration
  def change
  	add_column :seat_categories, :starting_row, :integer
  end
end
