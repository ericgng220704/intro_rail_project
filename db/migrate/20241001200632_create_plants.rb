class CreatePlants < ActiveRecord::Migration[7.2]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.text :other_names
      t.string :scientific_name
      t.string :family
      t.text :description
      t.string :image_url
      t.references :origin, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :watering, null: false, foreign_key: true
      t.references :growth_rate, null: false, foreign_key: true
      t.references :care, null: false, foreign_key: true
      t.boolean :thorny
      t.boolean :invasive
      t.boolean :tropical
      t.boolean :indoor
      t.boolean :flower
      t.boolean :cones
      t.boolean :fruits
      t.boolean :edible_fruit
      t.boolean :medicinal
      t.integer :poisonous_to_humans
      t.integer :poisonous_to_pets

      t.timestamps
    end
  end
end
