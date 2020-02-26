class PuppiesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index,:show]
  before_action :find_puppie, only:[:edit,:destroy,:update]

  def index
    @puppies = Puppy.all
    @puppies = policy_scope(Puppy).order(created_at: :desc)
    @puppies = Puppy.geocoded #returns flats with coordinates
    @markers = @puppies.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude,
         infoWindow: render_to_string(partial: "shared/info_window", locals: { puppy: puppy }),
         image_url: helpers.asset_url('https://library.kissclipart.com/20181214/qhe/kissclipart-cute-dog-clipart-puppy-siberian-husky-labrador-ret-ee2b2f765d4306db.png')
      }
    end
  end

    def mypuppies
      @puppies = Puppy.where(user_id: current_user)
      authorize @puppies
    end

  def new
    @puppy = Puppy.new
    authorize @puppy
  end

  def create

    @puppy = Puppy.new(params_puppy)
    authorize @puppy
    @puppy.user = current_user

    @puppy.latitude = @puppy.geocode[0]
    @puppy.longitude = @puppy.geocode[1]


    if @puppy.save
      redirect_to puppies_path
    else
      render :new
    end
  end

  def show

  @puppie = Puppie.find(params[:id])
  authorize @puppie
  @markers =
        {
          lat: @puppie.latitude,
          lng: @puppie.longitude,
           infoWindow: render_to_string(partial: "shared/info_window", locals: { puppie: @puppie }),
           image_url: helpers.asset_url('https://i.pinimg.com/originals/6f/1e/8b/6f1e8b15a860d0083116f8bd9e2778d6.png')
        }

  end

  def edit


  end

  def update
    @puppy.update(params_puppy)
    redirect_to puppies_path
  end

  def destroy

    puppy.destroy
    redirect_to puppies_path
  end

  private
  def params_puppy
    params.require(:puppy).permit(:name, :photo, :age, :price, :availability, :breed, :location)
  end

  def find_puppie
     @puppy = Puppy.find(params[:id])
     authorize @puppy
  end


end
