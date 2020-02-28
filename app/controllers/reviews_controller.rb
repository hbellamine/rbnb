class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:new, :create]
  def new
  end

  def create
    @review = Review.new(params_reviews)
    authorize @review
    @puppy = Puppy.find(params[:puppy_id])
    @review.puppy = @puppy

    if @review.save
      respond_to do |format|
        format.html { redirect_to puppy_path(@review.puppy_id) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'puppies' }
        format.js  # <-- idem
        end
    end
  end

 private
  def params_reviews
    params.require(:review).permit(:content, :rating, :puppy_id)
  end



end
