class AddColumnsToShowTimes < ActiveRecord::Migration
  def change
  	add_column :show_times, :date, :datetime
  	add_column :show_times, :time, :datetime
  	add_reference :show_times, :screen, index: true, foreign_key: true
  end
end
