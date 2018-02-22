class Item < ApplicationRecord
  belongs_to :finder, class_name: "User", foreign_key: "user_id"
  has_many :dispos
  # belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :dispos, dependent: :destroy
  validates :category, presence: true
  validates :date_found, presence: true
  validates :location, presence: true
  validates :name, presence: true, unless: :skip_if_item_creation

  attr_accessor :skip_if_item_creation

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  CATEGORIES = ["Bijoux", "Électronique", "Papiers d'identité", "Peluche", "Vêtements",  "Divers"]

  def skip_if_item_creation
    self.id.nil? && !self.category.nil? && !self.date_found.nil? && !self.location.nil?
  end
end
