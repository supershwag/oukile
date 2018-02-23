class AddDispoToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_reference(:meetings, :dispo)
  end
end
