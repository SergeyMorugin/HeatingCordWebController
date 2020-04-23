require 'rails_helper'

RSpec.describe "WeatherMeasures", type: :request do
  describe "GET /weather_measures" do
    it "works! (now write some real specs)" do
      get weather_measures_path
      expect(response).to have_http_status(200)
    end
  end
end
