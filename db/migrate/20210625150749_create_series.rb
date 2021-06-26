class CreateSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :series do |t|
      t.string :poster_path
      t.string :overview
      t.string :first_air_date
      t.string :genre_ids
      t.integer :external_id
      t.string :original_name
      t.string :original_language
      t.string :name
      t.integer :popularity
      t.integer :vote_count
      t.integer :vote_average

      t.timestamps
    end
  end
end
