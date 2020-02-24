class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
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
  params.require(:puppy).permit(:name, :photo, :age, :price, :availability, :breed, :user_id)

  end

end
