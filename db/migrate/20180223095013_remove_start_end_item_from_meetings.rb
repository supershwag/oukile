class RemoveStartEndItemFromMeetings < ActiveRecord::Migration[5.1]
  def change
    remove_column :meetings, :start_date
    remove_column :meetings, :end_date
    remove_column :meetings, :item_id
  end
end
