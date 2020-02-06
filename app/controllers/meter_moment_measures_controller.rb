class MeterMomentMeasuresController < ApplicationController
  before_action :set_meter_moment_measure, only: [:show, :edit, :update, :destroy]
  DEFAULT_MAX_RECORDS = 2880
  # GET /meter_moment_measures
  # GET /meter_moment_measures.json
  def index
    @limit = params[:limit] || DEFAULT_MAX_RECORDS
    @offset = params[:offset] || 0
    @meter_moment_measures = MeterMomentMeasure.all.order('created_at desc').limit(@limit).offset(@offset)
    @all_records_count = MeterMomentMeasure.all.count
  end

  # GET /meter_moment_measures/1
  # GET /meter_moment_measures/1.json
  def show
  end

  # GET /meter_moment_measures/new
  def new
    @meter_moment_measure = MeterMomentMeasure.new
  end

  # GET /meter_moment_measures/1/edit
  def edit
  end

  # POST /meter_moment_measures
  # POST /meter_moment_measures.json
  def create
    @meter_moment_measure = MeterMomentMeasure.new(meter_moment_measure_params)

    respond_to do |format|
      if @meter_moment_measure.save
        format.html { redirect_to @meter_moment_measure, notice: 'Meter moment measure was successfully created.' }
        format.json { render :show, status: :created, location: @meter_moment_measure }
      else
        format.html { render :new }
        format.json { render json: @meter_moment_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meter_moment_measures/1
  # PATCH/PUT /meter_moment_measures/1.json
  def update
    respond_to do |format|
      if @meter_moment_measure.update(meter_moment_measure_params)
        format.html { redirect_to @meter_moment_measure, notice: 'Meter moment measure was successfully updated.' }
        format.json { render :show, status: :ok, location: @meter_moment_measure }
      else
        format.html { render :edit }
        format.json { render json: @meter_moment_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meter_moment_measures/1
  # DELETE /meter_moment_measures/1.json
  def destroy
    @meter_moment_measure.destroy
    respond_to do |format|
      format.html { redirect_to meter_moment_measures_url, notice: 'Meter moment measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meter_moment_measure
      @meter_moment_measure = MeterMomentMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_moment_measure_params
      params.require(:meter_moment_measure).permit(:voltage, :amperage, :power)
    end
end
