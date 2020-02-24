class PagesController < ApplicationController
  def home
    @puppy = Puppy.new
  end
end
