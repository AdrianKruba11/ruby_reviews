class AddWatchedToMovies < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :watched, :boolean, default: false, null: false
  end
end
