require_relative "../services/weather_service"

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
    @name = params[:name]
    @city = params[:city]
    @w = WeatherService.get(@city)
    if @city and !$cities.key? @city.to_sym
        @temperature = (9/5) * (@w[:temperature] - 273) + 32
        city = City.new(
            name: @city,
            weather: @w,
            population: "unknown",
            landmark: "unknown"
        )
        city.save
    end
  end
end
