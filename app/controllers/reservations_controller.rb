class ReservationsController < ApplicationController
  # def show
  #   @reservation = Reservation.find(params[:id])
  # end

  # def new
  #   @reservation = Reservation.new
  # end

  # def edit
  #   @reservation = Reservation.find(params[:id])
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @reservation.user, :notice => "Reservation Made"
    else
      render 'restaurants/show'
    end
  end

  # def update
  #   @reservation = Reservation.find(params[:id])

  #   if @reservation.update_attributes(reservation_params)
  #     redirect_to reservation_path(@reservation)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.destroy
  #   redirect_to restaurants_url
  # end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :user_id, :start_time, :guests)
  end

end
