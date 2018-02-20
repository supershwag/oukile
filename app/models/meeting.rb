class Meeting < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :object
  has_one :user, through: :object

  validates :start_date, :end_date, presence: true
end
