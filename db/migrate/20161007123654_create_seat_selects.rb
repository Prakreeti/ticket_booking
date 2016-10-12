class CreateSeatSelects < ActiveRecord::Migration
  def change
    create_table :seat_selects do |t|

      t.timestamps null: false
    end
  end
end
