class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @puppies = Puppy.where(user_id: current_user)
    authorize @puppies
  end

  def new
    @booking = Booking.new
    @puppy = Puppy.find(params[:puppy_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user_id = current_user.id
    @puppy = Puppy.find(params[:puppy_id])
    @booking.puppy = @puppy
    @booking.bookrequest = false
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def update
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    authorize booking
    redirect_to bookings_path
  end

  private
  def params_booking
    params.require(:booking).permit(:startdate, :enddate)
  end

end
