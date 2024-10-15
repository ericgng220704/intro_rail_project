class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      render :new
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :description, :image_url, :origin_id, :type_id, :watering_id, :growth_rate_id, :care_id, :thorny, :invasive, :tropical, :indoor, :flower, :cones, :fruits, :edible_fruit, :medicinal, :poisonous_to_humans, :poisonous_to_pets)
  end
end
