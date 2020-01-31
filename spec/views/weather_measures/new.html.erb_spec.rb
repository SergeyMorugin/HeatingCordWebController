require 'rails_helper'

RSpec.describe "weather_measures/new", type: :view do
  before(:each) do
    assign(:weather_measure, WeatherMeasure.new(
      :temperature => 1.5,
      :pressure => 1.5,
      :humidity => 1.5,
      :rainfall => 1.5
    ))
  end

  it "renders new weather_measure form" do
    render

    assert_select "form[action=?][method=?]", weather_measures_path, "post" do

      assert_select "input[name=?]", "weather_measure[temperature]"

      assert_select "input[name=?]", "weather_measure[pressure]"

      assert_select "input[name=?]", "weather_measure[humidity]"

      assert_select "input[name=?]", "weather_measure[rainfall]"
    end
  end
end
