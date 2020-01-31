require 'rails_helper'

RSpec.describe "weather_measures/edit", type: :view do
  before(:each) do
    @weather_measure = assign(:weather_measure, WeatherMeasure.create!(
      :temperature => 1.5,
      :pressure => 1.5,
      :humidity => 1.5,
      :rainfall => 1.5
    ))
  end

  it "renders the edit weather_measure form" do
    render

    assert_select "form[action=?][method=?]", weather_measure_path(@weather_measure), "post" do

      assert_select "input[name=?]", "weather_measure[temperature]"

      assert_select "input[name=?]", "weather_measure[pressure]"

      assert_select "input[name=?]", "weather_measure[humidity]"

      assert_select "input[name=?]", "weather_measure[rainfall]"
    end
  end
end
