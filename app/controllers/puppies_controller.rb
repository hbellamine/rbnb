class PuppiesController < ApplicationController
  def index
    @puppies_loc = Puppy.geocoded #returns puppiess with coordinates

    @markers = @puppies_loc.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude
      }
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
