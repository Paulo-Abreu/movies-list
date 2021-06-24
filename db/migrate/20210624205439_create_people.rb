class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :profile_path
      t.boolean :adult
      t.string :name
      t.integer :popularity
      t.integer :external_id

      t.timestamps
    end
  end
end
