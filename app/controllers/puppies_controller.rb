class PuppiesController < ApplicationController
  def index

    @puppies_loc = Puppy.geocoded #returns puppiess with coordinates

    @markers = @puppies_loc.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude
      }
    end
    if params[:search].present?
      sql_search = "name ILIKE :search OR breed ILIKE :search"
      @puppies = Puppy.where(sql_search, search: "%#{params[:search]}%")
    else
      @puppies = Puppy.all
    end
  end

  def new
    @puppie = Puppy.new
  end

  def create
    @puppie = Puppy.new(params_puppy)
    @puppie.save
    raise
    redirect_to puppies_path
  end

  def show
  @puppie = Puppy.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def params_puppy
    params.require(:puppy).permit(:name, :photo, :age, :price, :availability, :breed, :current_user.id, :location)
  end

end
