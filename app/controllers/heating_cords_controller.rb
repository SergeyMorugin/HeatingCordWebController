class HeatingCordsController < ApplicationController
  def index
  	@heating_cord = HeatingCord.first
  	@last_moment_measure = MeterMomentMeasure.order('created_at desc').first
  	@last_wheather_measure = WeatherMeasure.order('created_at desc').first

    end_range = Time.now
    start_range = end_range- 1.day

    electricity_values = MeterMomentMeasure.where('created_at > ?',start_range).order('created_at asc')
    @power = electricity_values.pluck(:created_at, :power).to_h
    @power[start_range-1.minute] = 0
    @power[end_range+1.minute] = 0

    weather_values = WeatherMeasure.where('created_at > ?',start_range).order('created_at asc')
    @weather_t = weather_values.pluck(:created_at, :temperature).to_h
    @weather_t[start_range-1.minute] = 0
    @weather_t[end_range+1.minute] = 0

    @weather_p = weather_values.pluck(:created_at, :pressure).to_h
    #@weather_p[start_range-1.minute] = 0
    #@weather_p[end_range+1.minute] = 0

    @weather_h = weather_values.pluck(:created_at, :humidity).to_h
    #@weather_h[start_range-1.minute] = 0
    #@weather_h[end_range+1.minute] = 0
  end

  def update_mode
  	heating_cord = HeatingCord.first
    result = heating_cord.update_mode(params['mode'].to_i)
    if result['status'] = 'OK'
      case params['mode'].to_i
      when HeatingCord::HEATIN_CORD_OFF_MODE
        DevisesFactory.get_mercury.publish_switch_off
      when HeatingCord::HEATIN_CORD_MANUAL_ON_MODE
        DevisesFactory.get_mercury.publish_switch_on
      end
        #DevisesFactory.get_mercury.publish_0_values
    end

  	respond_to do |format|      
      format.html { redirect_to '/heating_cords/index', notice: "HeatingCord mode updated. #{result}" }
      format.json { render :index, status: :ok, result: result}      
    end

  end
end
