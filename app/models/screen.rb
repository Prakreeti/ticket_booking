class Screen < ActiveRecord::Base
	has_many :show_times, dependent: :destroy
	has_many :seats, dependent: :destroy
	belongs_to :hall
	validates :hall_id,  presence: true
	validates :total_seats,  presence: true, numericality: { only_integer: true }
	validates :total_columns,  presence: true, numericality: { only_integer: true }
	validates :total_rows,  presence: true, numericality: { only_integer: true }
end
