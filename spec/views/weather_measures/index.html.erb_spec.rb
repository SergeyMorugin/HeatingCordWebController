require 'rails_helper'

RSpec.describe "weather_measures/index", type: :view do
  before(:each) do
    assign(:weather_measures, [
      WeatherMeasure.create!(
        :temperature => 2.5,
        :pressure => 3.5,
        :humidity => 4.5,
        :rainfall => 5.5
      ),
      WeatherMeasure.create!(
        :temperature => 2.5,
        :pressure => 3.5,
        :humidity => 4.5,
        :rainfall => 5.5
      )
    ])
  end

  it "renders a list of weather_measures" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
  end
end
