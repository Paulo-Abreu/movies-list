class CreateFavoritesSeries < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites_series do |t|
      t.integer :serie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
