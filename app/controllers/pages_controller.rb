class PagesController < ApplicationController
  def home
    @dogs = Dog.all
    @dogs.reject do |dog|
      @visits = dog.visits
      @date = []
    end
  end
end
