class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :date_found
      t.string :location
      t.string :location_detailed
      t.string :photo_id
      t.string :reward
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
