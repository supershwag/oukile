class Meeting < ApplicationRecord
  belongs_to :loser, class_name: "User", foreign_key: "user_id"
  belongs_to :item
  has_one :user, through: :item
  has_one :dispo
end
