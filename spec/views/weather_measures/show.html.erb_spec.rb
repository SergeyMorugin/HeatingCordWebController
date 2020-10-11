require 'rails_helper'

RSpec.describe "weather_measures/show", type: :view do
  before(:each) do
    @weather_measure = assign(:weather_measure, WeatherMeasure.create!(
      :temperature => 2.5,
      :pressure => 3.5,
      :humidity => 4.5,
      :rainfall => 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
  end
end
