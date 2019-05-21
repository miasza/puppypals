class VisitsController < ApplicationController
  before_action :set_visit, only: :destroy

  def create
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.new(visit_params)
    authorize @visit
    @visit.user = current_user
    @visit.dog = @dog
    if @visit.save
      redirect_to dog_path(@dog)
    else
      render 'dogs/show'
    end
  end

  def destroy
    @dog = @visit.dog
    @visit.destroy
    redirect_to playdates_path
  end

  private

  def visit_params
    params.require(:visit).permit(:date)
  end

  def set_visit
    @visit = Visit.find(params[:id])
    authorize @visit
  end
end
