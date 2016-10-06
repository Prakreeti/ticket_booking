class AddColumnsToScreen < ActiveRecord::Migration
  def change
  	add_column :screens, :total_seats, :integer
  end
end
