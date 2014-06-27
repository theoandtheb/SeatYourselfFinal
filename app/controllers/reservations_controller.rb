class ReservationsController < ApplicationController

  before_action :load_restaurant, :except => [:index, :show, :edit]
  before_action :ensure_logged_in, :except => [:load_restaurant, :reservations_params]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = @restaurant.reservations
  end

  def create
    @reservation = @restaurant.reservations.build(reservations_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to root_path, notice: "Reservation made" # add where
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])

    if @reservation.update_attributes(reservations_params)
      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
  end

private
  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
   # why does the params store this?
  end

  def reservations_params
    params.require(:reservation).permit(:time, :party_size, :user_id, :restaurant_id, :date)
  end

end
