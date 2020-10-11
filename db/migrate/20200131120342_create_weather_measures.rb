class CreateWeatherMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_measures do |t|
      t.float :temperature
      t.float :pressure
      t.float :humidity
      t.float :rainfall

      t.timestamps
    end
  end
end
