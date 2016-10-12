class ChangeColumnNameInSeatCategory < ActiveRecord::Migration
  def change
  	rename_column :seat_categories, :type, :seat_type
  end
end
