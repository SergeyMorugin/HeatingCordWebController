require 'test_helper'

class MeterMomentMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meter_moment_measure = meter_moment_measures(:one)
  end

  test "should get index" do
    get meter_moment_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_meter_moment_measure_url
    assert_response :success
  end

  test "should create meter_moment_measure" do
    assert_difference('MeterMomentMeasure.count') do
      post meter_moment_measures_url, params: { meter_moment_measure: { amperage: @meter_moment_measure.amperage, power: @meter_moment_measure.power, voltage: @meter_moment_measure.voltage } }
    end

    assert_redirected_to meter_moment_measure_url(MeterMomentMeasure.last)
  end

  test "should show meter_moment_measure" do
    get meter_moment_measure_url(@meter_moment_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_meter_moment_measure_url(@meter_moment_measure)
    assert_response :success
  end

  test "should update meter_moment_measure" do
    patch meter_moment_measure_url(@meter_moment_measure), params: { meter_moment_measure: { amperage: @meter_moment_measure.amperage, power: @meter_moment_measure.power, voltage: @meter_moment_measure.voltage } }
    assert_redirected_to meter_moment_measure_url(@meter_moment_measure)
  end

  test "should destroy meter_moment_measure" do
    assert_difference('MeterMomentMeasure.count', -1) do
      delete meter_moment_measure_url(@meter_moment_measure)
    end

    assert_redirected_to meter_moment_measures_url
  end
end
