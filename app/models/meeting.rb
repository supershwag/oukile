class Meeting < ApplicationRecord
  belongs_to :loser, class_name: "User", foreign_key: "user_id"
  has_one :user, through: :item
  belongs_to :dispo
end
