class VisitsController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.new(visit_params)
    @visit.user = current_user
    @visit.dog = @dog
    if @visit.save
      redirect_to dog_visits_path(@dog)
    else
      render 'dogs/show'
    end
  end

  def destroy
    @dog = Dog.find(params[:dog_id])
    @visit = @dog.visit
    @visit.destroy
    redirect_to dog_visits_path(@dog)
  end

  private

  def visit_params
    params.require(:visit).permit(:date)
  end
end
