class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
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

    authorize @booking

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def params_booking
    params.require(:booking).permit(:startdate, :enddate)
  end

end
