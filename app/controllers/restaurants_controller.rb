class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def rating
    Rating.create(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      value: params[:value])

    render text: 'Rating saved!'
  end


  def index
    if user_signed_in?
      @restaurants = current_user.restaurants.all
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    if user_signed_in?
      @restaurant = current_user.restaurants.find(params[:id])
    else
      @restaurant = Restaurant.find(params[:id])
    end
    @has_rating = @restaurant.ratings.count > 0
    @avg_rating = @restaurant.calculate_avg_rating
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
    puts current_user
    puts params[:id]
    @restaurant = current_user.restaurants.find(params[:id])
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
