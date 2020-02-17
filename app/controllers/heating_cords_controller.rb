class HeatingCordsController < ApplicationController
  def index
  	@heating_cord = HeatingCord.first
  	@last_moment_measure = MeterMomentMeasure.order('created_at desc').first
  	@last_wheather_measure = WeatherMeasure.order('created_at desc').first
    @data = [] 
    #@data['t'] = {}
    end_range = Time.now
    start_range = end_range- 1.day
    finish = Time
    weather_values = WeatherMeasure.where('created_at > ?',start_range).order('created_at asc')
    @weather = {}#{name: 'Temperature', data: {}} 
    weather_values.map{|d| @weather[d.created_at] = d.temperature }
    @weather[start_range-1.minute] = 0
    @weather[end_range+1.minute] = 0
    #weather[:max] = weather[:data].values.max
    #weather[:min] = weather[:data].values.min

    electricity_values = MeterMomentMeasure.where('created_at > ?',start_range).order('created_at asc')
    @power = {}#{name: 'ElPower', data: {}} 
    electricity_values.map{|d| @power[d.created_at] = d.power }
    @power[start_range-1.minute] = 0
    @power[end_range+1.minute] = 0

    
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
