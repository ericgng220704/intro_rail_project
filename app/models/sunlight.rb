class Sunlight < ApplicationRecord
  has_many :sunlight_plants
  has_many :plants, through: :sunlight_plants
end
