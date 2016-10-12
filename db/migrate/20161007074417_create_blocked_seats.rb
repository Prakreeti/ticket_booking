class CreateBlockedSeats < ActiveRecord::Migration
  def change
    create_table :blocked_seats do |t|

      t.timestamps null: false
    end
  end
end
