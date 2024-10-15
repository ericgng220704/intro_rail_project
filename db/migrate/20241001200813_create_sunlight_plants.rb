class CreateSunlightPlants < ActiveRecord::Migration[7.2]
  def change
    create_table :sunlight_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :sunlight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
