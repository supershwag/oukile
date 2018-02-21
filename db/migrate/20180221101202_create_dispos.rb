class CreateDispos < ActiveRecord::Migration[5.1]
  def change
    create_table :dispos do |t|
      t.string :start_date
      t.string :end_date
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
