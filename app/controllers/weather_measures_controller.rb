class WeatherMeasuresController < ApplicationController
  before_action :set_weather_measure, only: [:show, :edit, :update, :destroy]

  # GET /weather_measures
  # GET /weather_measures.json
  def index
    @weather_measures = WeatherMeasure.all
  end

  # GET /weather_measures/1
  # GET /weather_measures/1.json
  def show
  end

  # GET /weather_measures/new
  def new
    @weather_measure = WeatherMeasure.new
  end

  # GET /weather_measures/1/edit
  def edit
  end

  # POST /weather_measures
  # POST /weather_measures.json
  def create
    @weather_measure = WeatherMeasure.new(weather_measure_params)

    respond_to do |format|
      if @weather_measure.save
        format.html { redirect_to @weather_measure, notice: 'Weather measure was successfully created.' }
        format.json { render :show, status: :created, location: @weather_measure }
      else
        format.html { render :new }
        format.json { render json: @weather_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_measures/1
  # PATCH/PUT /weather_measures/1.json
  def update
    respond_to do |format|
      if @weather_measure.update(weather_measure_params)
        format.html { redirect_to @weather_measure, notice: 'Weather measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @weather_measure }
      else
        format.html { render :edit }
        format.json { render json: @weather_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_measures/1
  # DELETE /weather_measures/1.json
  def destroy
    @weather_measure.destroy
    respond_to do |format|
      format.html { redirect_to weather_measures_url, notice: 'Weather measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_measure
      @weather_measure = WeatherMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_measure_params
      params.require(:weather_measure).permit(:temperature, :pressure, :humidity, :rainfall)
    end
end
