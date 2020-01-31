require "rails_helper"

RSpec.describe WeatherMeasuresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/weather_measures").to route_to("weather_measures#index")
    end

    it "routes to #new" do
      expect(:get => "/weather_measures/new").to route_to("weather_measures#new")
    end

    it "routes to #show" do
      expect(:get => "/weather_measures/1").to route_to("weather_measures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/weather_measures/1/edit").to route_to("weather_measures#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/weather_measures").to route_to("weather_measures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/weather_measures/1").to route_to("weather_measures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/weather_measures/1").to route_to("weather_measures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/weather_measures/1").to route_to("weather_measures#destroy", :id => "1")
    end
  end
end
