class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, :notice => "Welcome to Seat Yourself, #{@user.name}"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to restaurants_path, :notice => "#{@user.name} was deleted."
  end

  def reservations
    @reservations = Reservation.all
    @user = current_user
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end

end
