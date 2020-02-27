class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:new, :create]
  def new
  end

  def create
    @review = Review.new(params_reviews)
    authorize @review
    @review.save
    redirect_to puppy_path(@review.puppy_id)
  end

  private

  def params_reviews
    params.require(:review).permit(:content, :rating, :puppy_id)
  end

end
