class PagesController < ApplicationController
  def home
    @puppie = Puppie.new
  end


end
