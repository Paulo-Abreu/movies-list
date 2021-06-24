class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :poster_path
      t.boolean :adult
      t.string :overview
      t.string :release_date
      t.string :genre_ids
      t.integer :external_id
      t.string :original_title
      t.string :original_language
      t.string :title
      t.integer :popularity
      t.integer :vote_count
      t.integer :vote_average

      t.timestamps
    end
  end
end
