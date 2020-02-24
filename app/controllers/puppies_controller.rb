class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.new(params_puppy)
    @puppy.save
    redirect_to puppies_index_path
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def params_puppy
  params.require(:puppy).permit(:name, :photo, :age, :availability, :breed)

  end

end
