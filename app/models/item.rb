class Item < ApplicationRecord
  belongs_to :finder, class_name: "User", foreign_key: "user_id"
  # belongs_to :user
  validates :category, presence: true
  validates :date_found, presence: true
  validates :location, presence: true
end
