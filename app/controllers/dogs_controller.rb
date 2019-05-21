class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dogs_path
    else
      render :new
    end
  end

  def playdates
    @visits = Visit.where(user_id: current_user.id)
    @dogs = Dog.all
  end

  def show
    @visit = Visit.new
    @dog = Dog.find(params[:id])
    @visits = @dog.visits
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:breed, :name, :size, :price, :photo, :age, :address, :description)
  end
end
