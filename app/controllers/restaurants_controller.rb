class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :dashboard]

  def rating
    Rating.create(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      value: params[:value])

    render html: '<div class="fade"><h5>Rating saved!</h5></div>'.html_safe
  end

  def dashboard
      @restaurants = current_user.restaurants.all
  end

  def index
    if current_user && current_user.owner?
      redirect_to dashboard_path
      return true
    end
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # 2 states needed: for owners&visitors: they are just supposed to see the current rating or "no rating yet!"
    # and a state for a patron: he should be able to rate, if he did not yet!
    #@has_rating = @restaurant.ratings.count > 0
    if current_user
      @has_rating = Rating.where(restaurant_id: @restaurant.id, user_id: current_user.id).exists? #patron rating!
    else
      @has_rating = @restaurant.ratings.count > 0
    end
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
    params.require(:restaurant).permit(:name, :description, :full_address, :phone, :photo)
  end

end
