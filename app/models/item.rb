class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w(doudou papiers bijoux vetements electronique divers)}
  validates :date_found, presence: true
  validates :location, presence: true
  validates :photo_id, presence: true
end
