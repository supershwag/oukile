class Item < ApplicationRecord
  belongs_to :finder, class_name: "User", foreign_key: "user_id"
  has_many :dispos
  # belongs_to :user
  validates :category, presence: true
  validates :date_found, presence: true
  validates :location, presence: true
  validates :name, presence: true, unless: :skip_if_item_creation
  validates :photo_id, presence: true, unless: :skip_if_item_creation

  attr_accessor :skip_if_item_creation

  def skip_if_item_creation
    self.id.nil? && !self.category.nil? && !self.date_found.nil? && !self.location.nil?
  end
end
