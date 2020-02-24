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
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
