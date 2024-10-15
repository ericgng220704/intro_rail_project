class Animal < ApplicationRecord
  has_many :animal_plants
  has_many :plants, through: :animal_plants
end
