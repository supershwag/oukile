class Item < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  validates :date_found, presence: true
  validates :location, presence: true
end
