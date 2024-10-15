class Plant < ApplicationRecord
  belongs_to :origin
  belongs_to :type
  belongs_to :watering
  belongs_to :growth_rate
  belongs_to :care

  has_many :animal_plants
  has_many :animals, through: :animal_plants

  has_many :sunlight_plants
  has_many :sunlights, through: :sunlight_plants

  has_many :propagation_plants
  has_many :propagations, through: :propagation_plants

  validates :common_name, presence: true

  # Boolean validations
  validates :thorny, :invasive, :tropical, :indoor, :flower, :cones,
            :fruits, :edible_fruit, :medicinal, inclusion: { in: [true, false] }
end
