class CreateSeatCategories < ActiveRecord::Migration
  def change
    create_table :seat_categories do |t|

      t.timestamps null: false
    end
  end
end
