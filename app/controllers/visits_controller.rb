class VisitsController < ApplicationController
  before_action :set_visit, only: :destroy

  def create
    @dog = Dog.find(params[:dog_id])
    @visit = Visit.new(visit_params)
    authorize @visit
    @visit.user = current_user
    @visit.dog = @dog
    @visits = @dog.visits
    if @visit.date < Date.today
      flash[:alert] = "The date entered has already passed. Please provide future date"
      render 'dogs/show'
    else
      if @visit.save
      flash[:notice] = "Your request to book #{@dog.name} has been received. Check your playdates to see once the owner accepts your request"
      redirect_to playdates_path
      else
      render 'dogs/show'
      end
    end
  end

  def destroy
    @dog = @visit.dog
    @visit.destroy
    redirect_to playdates_path
  end

  def accept
    @dogs = Dog.where(user: current_user)
    @visit = Visit.find(params[:visit_id])
    authorize @visit
    if @visit.update(status: "approved")
      flash[:notice] = "You've approved the booking request"
      redirect_to mypals_path
    else
      render 'dogs/mypals'
    end
  end

  def decline
    @dogs = Dog.where(user: current_user)
    @visit = Visit.find(params[:visit_id])
    authorize @visit
    if @visit.update(status: "declined")
      flash[:notice] = "You've declined the booking request"
      redirect_to mypals_path
    else
      render 'dogs/mypals'
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:date, :status)
  end

  def set_visit
    @visit = Visit.find(params[:id])
    authorize @visit
  end
end
