class PagesController < ApplicationController
  def home
    @puppie = Puppy.new
  end


end
