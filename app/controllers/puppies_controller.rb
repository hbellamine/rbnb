class PuppiesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index,:show]
  before_action :find_puppie, only:[:edit,:destroy,:update]

  def index

    @puppies = policy_scope(Puppy).order(created_at: :desc)


    if params[:search]

  @puppies = Puppy.search_by_name_and_breed(params[:search])
  else
  @puppies = Puppy.all
  end

    # @puppies = Puppy.geocoded #returns flats with coordinates
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
      @booking =[]
      @puppies = Puppy.where(user_id: current_user)
      @puppies.each do |puppy|

        booking = Booking.where(puppy_id: puppy.id )

        if booking.count > 1 then
          booking.each do |booking|
            @booking << booking
          end
        elsif booking.count == 1
          @booking << booking[0]
        end

        @allbookings = Booking.all
      end
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
    @booking = Booking.new

    @reviews = Review.all
    @review = Review.new
    @puppy = Puppy.find(params[:id])
    @review.puppy_id = @puppy.id


  @bookingsconfirmed =[]

  booking = Booking.where(puppy_id: @puppy.id )

        if booking.count > 1 then
          booking.each do |booking|
            @bookingsconfirmed << booking
              end
        elsif booking.count == 1
          @bookingsconfirmed << booking[0]
        end




  authorize @puppy
  @markers =
        {
          lat: @puppy.latitude,
          lng: @puppy.longitude,
           infoWindow: render_to_string(partial: "shared/info_window", locals: { puppy: @puppy }),
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

    @puppy.destroy
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
