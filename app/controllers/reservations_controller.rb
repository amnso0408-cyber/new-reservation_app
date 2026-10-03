class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def show
    
  end

  def new
   
  end

 def create
  @reservation = Reservation.new(reservation_params)
  @reservation.user = current_user

  if @reservation.save
    redirect_to reservations_path
  else
    render :confirm, status: :unprocessable_entity
  end
end
  
  def confirm
  @reservation = Reservation.new(reservation_params)
  @reservation.user = current_user
  @room = Room.find(@reservation.room_id)

    if @reservation.valid?
      #OK
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end
  
  def edit
 
  end

  def update

  end

  def destroy
   
  end


  private

  def reservation_params
  params.require(:reservation).permit(
    :room_id,
    :checkin_at,
    :checkout_at,
    :guest_count
  )
  end
end
