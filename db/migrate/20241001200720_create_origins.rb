class CreateOrigins < ActiveRecord::Migration[7.2]
  def change
    create_table :origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
