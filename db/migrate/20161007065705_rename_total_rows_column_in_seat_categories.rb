class RenameTotalRowsColumnInSeatCategories < ActiveRecord::Migration
  def change
  	rename_column :seat_categories, :number_of_rows, :ending_row
  end
end
