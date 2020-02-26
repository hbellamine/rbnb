class PuppiesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index,:show]
  before_action :find_puppie, only:[:edit,:destroy,:update]

  def index

      @puppies = Puppie.all
      @puppies = policy_scope(Puppie).order(created_at: :desc)
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

    def mypuppies
      @puppies = Puppie.where(user_id: current_user)
      authorize @puppies
    end

  def new
    @puppie = Puppie.new
    authorize @puppie
  end

  def create

    @puppie = Puppie.new(params_puppy)
    authorize @puppie
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
  authorize @puppie
  end

  def edit


  end

  def update

    @puppie.update(params_puppy)
    redirect_to puppies_path
  end

  def destroy

    puppie.destroy
    redirect_to puppies_path
  end

  private
  def params_puppy
    params.require(:puppie).permit(:name, :photo, :age, :price, :availability, :breed, :location)
  end

  def find_puppie
     @puppie = Puppie.find(params[:id])
     authorize @puppie
  end


end
