class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.geocoded #returns puppiess with coordinates

    @markers = @puppies.map do |puppy|
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
