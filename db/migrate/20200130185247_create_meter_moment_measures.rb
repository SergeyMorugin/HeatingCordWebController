class CreateMeterMomentMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_moment_measures do |t|
      t.float :voltage
      t.float :amperage
      t.float :power

      t.timestamps
    end
  end
end
