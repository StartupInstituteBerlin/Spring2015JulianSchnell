class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new(restaurant_id: params[:restaurant_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to restaurants_path, :notice => "Reservation has been saved!"
    else
      render 'new'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:email, :date, :msg, :restaurant_id)
  end
end
