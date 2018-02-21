class Item < ApplicationRecord
  belongs_to :finder, class_name: "User", foreign_key: "user_id"
  # belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :dispos, dependent: :destroy
  validates :category, presence: true
  validates :date_found, presence: true
  validates :location, presence: true
  validates :name, presence: true, unless: :skip_if_item_creation

  attr_accessor :skip_if_item_creation

  def skip_if_item_creation
    self.id.nil? && !self.category.nil? && !self.date_found.nil? && !self.location.nil?
  end
end
