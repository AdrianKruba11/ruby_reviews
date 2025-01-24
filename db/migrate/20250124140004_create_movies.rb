class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :release_year, :integer, null: false
      t.string :category, null: false
      t.integer :rating, null: false
      t.boolean :status, default: false, null: false

      t.timestamps
    end
  end
end
