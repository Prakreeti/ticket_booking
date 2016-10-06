class AddColumnsToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :title, :longtext
  	add_column :movies, :director, :longtext
  	add_column :movies, :cast, :longtext
  	add_column :movies, :description, :longtext
  	add_column :movies, :duration, :text
  end
end
