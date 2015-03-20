class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]

  def index
    restaurant_ids = current_user.restaurants.pluck(:id)
    @reservations = Reservation.where(restaurant_id: restaurant_ids)
  end

  def new
    @reservation = Reservation.new(restaurant_id: params[:restaurant_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to restaurants_path, :notice => "Reservation saved!"
    else
      render 'new'
    end
  end

  def destroy
    Reservation.find(params[:id]).destroy
    redirect_to restaurants_path, notice: "Reservation confirmed!"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:email, :reservation_date, :msg, :restaurant_id)
  end
end
