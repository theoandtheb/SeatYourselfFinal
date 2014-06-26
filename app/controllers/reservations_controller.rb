class ReservationsController < ApplicationController

  before_action :load_product

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
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

private
  def load_product
    @product = Product.find(params[:product_id]) #why does the params store this?
  end

  def reservations_params
    params.require(:reservation).permit(:time, :party_size, :user_id, :restaurant_id, :date)
  end

end
