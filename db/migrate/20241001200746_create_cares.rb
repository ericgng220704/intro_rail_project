class CreateCares < ActiveRecord::Migration[7.2]
  def change
    create_table :cares do |t|
      t.string :level

      t.timestamps
    end
  end
end
