class AddTotalRowsColumnsToScreens < ActiveRecord::Migration
  def change
  	add_column :screens, :total_rows, :integer
  	add_column :screens, :total_columns, :integer
  end
end
