class AddReferencesToHallInScreen < ActiveRecord::Migration
  def change
  	add_reference :screens, :hall, index: true, foreign_key: true
  end
end
