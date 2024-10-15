class CreatePropagationPlants < ActiveRecord::Migration[7.2]
  def change
    create_table :propagation_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :propagation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
