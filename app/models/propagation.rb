class Propagation < ApplicationRecord
  has_many :propagation_plants
  has_many :plants, through: :propagation_plants
end
