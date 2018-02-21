class Dispo < ApplicationRecord
  belongs_to :item
  has_one :finder, through: :item
end
