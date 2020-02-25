class PuppiesController < ApplicationController
  before_action :authenticate_user!
  def index


    # @puppies_loc = Puppie.geocoded #returns puppiess with coordinates

    # @markers = @puppies_loc.map do |puppy|
    #   {
    #     lat: puppie.latitude,
    #     lng: puppie.longitude
    #   }
    # end
    # if params[:search].present?
    #   sql_search = "name ILIKE :search OR breed ILIKE :search"
    #   @puppies = Puppie.where(sql_search, search: "%#{params[:search]}%")
    # else
      @puppies = Puppie.all


      @puppies = Puppie.geocoded #returns flats with coordinates

      @markers = @puppies.map do |puppie|
        {
          lat: puppie.latitude,
          lng: puppie.longitude,
           infoWindow: render_to_string(partial: "shared/info_window", locals: { puppie: puppie }),
           image_url: helpers.asset_url('https://i.pinimg.com/originals/6f/1e/8b/6f1e8b15a860d0083116f8bd9e2778d6.png')
        }
      end

end




  def new
    @puppie = Puppie.new
  end

  def create
    @puppie = Puppie.new(params_puppy)
    @puppie.user = current_user

    @puppie.latitude = @puppie.geocode[0]
    @puppie.longitude = @puppie.geocode[1]


    if @puppie.save
      redirect_to puppies_path
    else
      render :new
    end
  end

  def show
    @puppie = Puppie.find(params[:id])
  end

  def edit
     @puppie = Puppie.find(params[:id])

  end

  def update
    @puppie = Puppie.find(params[:id])
    @puppie.update(params_puppy)
    redirect_to puppies_path
  end

  def destroy
    puppie = Puppie.find(params[:id])
    puppie.destroy
    redirect_to puppies_path
  end

  private
  def params_puppy
    params.require(:puppie).permit(:name, :photo, :age, :price, :availability, :breed, :location)
  end

end
