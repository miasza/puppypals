class DogReviewsController < ApplicationController
  def index
    @dog = Dog.find(params[:dog_id])
    @reviews = policy_scope(@dog.dog_reviews)
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @review = DogReview.new
    authorize @review
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @review = DogReview.new(review_params)
    @review.dog = @dog
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to dog_dog_reviews_path(@dog)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:dog_review).permit(:rating, :content)
  end
end
