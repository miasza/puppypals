class DogsController < ApplicationController
  before_action :set_dog, only: %i[show destroy]

  def index
    @dogs = policy_scope(Dog)
    if params[:location].present?
      @dogs = @dogs.near(params[:location], 20)
    end
    if params[:date].present?
      date = Date.parse(params[:date])
      booked_dogs = @dogs.joins(:visits).where(visits: {date: date})
      @dogs = @dogs - booked_dogs
    end

    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { dog: dog })
      }
    end
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to dogs_path
    else
      render :new
    end
  end

  def playdates
    @visits = policy_scope(Visit)
    @dogs = Dog.all
  end

  def show
    @visit = Visit.new
    @visits = @dog.visits
    @users = User.all
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  def mypals
    @dogs = Dog.where(user: current_user)
    authorize @dogs

  end

  private

  def dog_params
    params.require(:dog).permit(:breed, :name, :size, :price, :photo, :age, :address, :description)
  end

  def set_dog
    @dog = Dog.find(params[:id])
    authorize @dog
  end
end
