class AddColumnsToSeatCategory < ActiveRecord::Migration
  def change
  	add_column :seat_categories, :type, :longtext
  end
end
