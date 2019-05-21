class VisitsController < ApplicationController
  def index
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @visits = Visit.where(user_id: @user.id, dog_id: @dog.id)
  end

  def new
    @visit = Visit.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.new(visit_params)
    @visit.user = @user
    @visit.dog = @dog
    if @visit.save
      redirect_to dog_visits_path(@dog)
    else
      render :new
    end
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to dog_visits_path(@dog)
  end

  private

  def visit_params
    params.require(:visit).permit(:date)
  end
end
