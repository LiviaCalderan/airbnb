class Amenity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  has_many :property_amenities, dependent: :destroy
end
