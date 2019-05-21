class VisitsController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.new(visit_params)
    @visit.user = current_user
    @visit.dog = @dog
    if @visit.save
      redirect_to dog_path(@dog)
    else
      render 'dogs/show'
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @dog = @visit.dog
    @visit.destroy
    redirect_to playdates_path
  end

  private

  def visit_params
    params.require(:visit).permit(:date)
  end
end
