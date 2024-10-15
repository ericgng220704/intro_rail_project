class CreateWaterings < ActiveRecord::Migration[7.2]
  def change
    create_table :waterings do |t|
      t.string :level

      t.timestamps
    end
  end
end
