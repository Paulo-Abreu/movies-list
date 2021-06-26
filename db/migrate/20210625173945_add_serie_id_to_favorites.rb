class AddSerieIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :serie_id, :integer
  end
end
