require "application_system_test_case"

class MeterMomentMeasuresTest < ApplicationSystemTestCase
  setup do
    @meter_moment_measure = meter_moment_measures(:one)
  end

  test "visiting the index" do
    visit meter_moment_measures_url
    assert_selector "h1", text: "Meter Moment Measures"
  end

  test "creating a Meter moment measure" do
    visit meter_moment_measures_url
    click_on "New Meter Moment Measure"

    fill_in "Amperage", with: @meter_moment_measure.amperage
    fill_in "Power", with: @meter_moment_measure.power
    fill_in "Voltage", with: @meter_moment_measure.voltage
    click_on "Create Meter moment measure"

    assert_text "Meter moment measure was successfully created"
    click_on "Back"
  end

  test "updating a Meter moment measure" do
    visit meter_moment_measures_url
    click_on "Edit", match: :first

    fill_in "Amperage", with: @meter_moment_measure.amperage
    fill_in "Power", with: @meter_moment_measure.power
    fill_in "Voltage", with: @meter_moment_measure.voltage
    click_on "Update Meter moment measure"

    assert_text "Meter moment measure was successfully updated"
    click_on "Back"
  end

  test "destroying a Meter moment measure" do
    visit meter_moment_measures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meter moment measure was successfully destroyed"
  end
end
