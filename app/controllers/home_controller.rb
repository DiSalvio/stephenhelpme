class HomeController < ApplicationController
  def index
    @place = Place.last 
  end
end
