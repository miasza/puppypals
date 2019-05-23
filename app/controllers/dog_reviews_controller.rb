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

  def edit
    @dog_review = DogReview.find(params[:id])
    authorize @dog_review
    @dog = Dog.find(params[:dog_id])
  end

  def update
    @dog_review = DogReview.find(params[:id])
    authorize @dog_review
    if @dog_review.update(review_params)
      redirect_to playdates_path
      flash[:notice] = "Change successfully saved!"
    else
      render :edit
      flash[:alert] = "Could not be saved. Please try again!"
    end
  end

  private

  def review_params
    params.require(:dog_review).permit(:rating, :content)
  end
end
