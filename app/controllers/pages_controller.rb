class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @puppy = Puppy.new
  end


end
