class HeatingCordsController < ApplicationController
  def index
  	@heating_cord = HeatingCord.first
  	@last_moment_measure = MeterMomentMeasure.order('created_at desc').first
  end

  def update_mode
  	heating_cord = HeatingCord.first
    heating_cord.update_mode(params['mode'].to_i)
  	respond_to do |format|      
      format.html { redirect_to '/heating_cords/index', notice: 'HeatingCord mode was successfully updated.' }
      format.json { render :index, status: :ok }      
    end

  end
end
