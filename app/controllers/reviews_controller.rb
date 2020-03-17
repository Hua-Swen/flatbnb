class ReviewsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    @review.flat = @flat
    @review.save
    if @review.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :flat_id, :traveller_id)
  end
end

# :traveller_id not working because we need login features.
