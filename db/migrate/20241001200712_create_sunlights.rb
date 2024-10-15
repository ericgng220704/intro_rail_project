class CreateSunlights < ActiveRecord::Migration[7.2]
  def change
    create_table :sunlights do |t|
      t.string :name

      t.timestamps
    end
  end
end
