class PuppiesController < ApplicationController
  def index
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
