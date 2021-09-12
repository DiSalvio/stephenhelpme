class PlacesController < ApplicationController
  def show
    @place = Place.last
  end

  def new
    @place = Place.new
  end

  def create
    place = Place.new(place_params)
    place.admin_id = current_admin.id
    if place.save
      redirect_to root_path
    end
  end

  private
  def place_params
    params.require(:place).permit(:name)
  end
end
