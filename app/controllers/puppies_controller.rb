class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all?
  end

  def new
    @puppy = Puppy.new
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
