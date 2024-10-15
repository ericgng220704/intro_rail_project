class CreatePropagations < ActiveRecord::Migration[7.2]
  def change
    create_table :propagations do |t|
      t.string :name

      t.timestamps
    end
  end
end
