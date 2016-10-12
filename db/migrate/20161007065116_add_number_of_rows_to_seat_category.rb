class AddNumberOfRowsToSeatCategory < ActiveRecord::Migration
  def change
  	add_column :seat_categories, :number_of_rows, :integer
  end
end
