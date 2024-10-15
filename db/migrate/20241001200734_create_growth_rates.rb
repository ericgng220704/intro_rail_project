class CreateGrowthRates < ActiveRecord::Migration[7.2]
  def change
    create_table :growth_rates do |t|
      t.string :level

      t.timestamps
    end
  end
end
