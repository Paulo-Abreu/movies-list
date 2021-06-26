class AddNameToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :name, :string
  end
end
