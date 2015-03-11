class RestaurantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @restaurants = current_user.restaurants.all
  end

  def show
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = current_uster.restaurants.find(params[:id])
  end

  def update
    @restaurant = current_user.restaurants.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: "Your restaurant has been deleted!"
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :full_address, :phone)
  end
end
