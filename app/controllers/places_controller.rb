class PlacesController < ApplicationController
  def index
  end

  def show
    @place = BeermappingApi.place_in(session['last_city'], params[:id])
  end
  
  def search
    city = params[:city]
    binding.pry
    @places = BeermappingApi.places_in(city)
    @weather = WeatherService.weather_for(city)
    session['last_city'] = city

    render :index
  end
end
