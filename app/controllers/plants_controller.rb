class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    # Search by name
    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @plants = @plants.where("LOWER(common_name) LIKE ? OR LOWER(scientific_name) LIKE ?", search_term, search_term)
    end

    # Filter by type
    @plants = @plants.where(type_id: params[:type]) if params[:type].present?

    # Filter by characteristics
    @plants = @plants.where(thorny: true) if params[:thorny] == '1'
    @plants = @plants.where(tropical: true) if params[:tropical] == '1'
    @plants = @plants.where(indoor: true) if params[:indoor] == '1'
    @plants = @plants.where(invasive: true) if params[:invasive] == '1'
    @plants = @plants.where(flower: true) if params[:flower] == '1'
    @plants = @plants.where(cones: true) if params[:cones] == '1'
    @plants = @plants.where(fruits: true) if params[:fruits] == '1'
    @plants = @plants.where(edible_fruit: true) if params[:edible_fruit] == '1'
    @plants = @plants.where(medicinal: true) if params[:medicinal] == '1'

    # Filter by plant care
    @plants = @plants.where(watering_id: params[:watering]) if params[:watering].present?
    @plants = @plants.where(growth_rate_id: params[:growth_rate]) if params[:growth_rate].present?

    # Pagination
    @plants = @plants.page(params[:page]).per(48)
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
