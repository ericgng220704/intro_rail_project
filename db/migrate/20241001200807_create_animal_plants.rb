class CreateAnimalPlants < ActiveRecord::Migration[7.2]
  def change
    create_table :animal_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
