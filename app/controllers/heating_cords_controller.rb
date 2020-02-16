class HeatingCordsController < ApplicationController
  def index
  	@heating_cord = HeatingCord.first
  	@last_moment_measure = MeterMomentMeasure.order('created_at desc').first
  	@last_wheather_measure = WeatherMeasure.order('created_at desc').first
    @data = {} 
    #@data['t'] = {}

    weather_values = WeatherMeasure.order('created_at desc').limit(1440)
    
    weather_values.map{|d| @data[d.created_at] = d.temperature }
    @data_max = @data.values.max
    @data_min = @data.values.min
  end

  def update_mode
  	heating_cord = HeatingCord.first
    result = heating_cord.update_mode(params['mode'].to_i)
  	respond_to do |format|      
      format.html { redirect_to '/heating_cords/index', notice: "HeatingCord mode updated. #{result}" }
      format.json { render :index, status: :ok, result: result}      
    end

  end
end
