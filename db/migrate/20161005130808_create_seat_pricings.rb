class CreateSeatPricings < ActiveRecord::Migration
  def change
    create_table :seat_pricings do |t|

      t.timestamps null: false
    end
  end
end
