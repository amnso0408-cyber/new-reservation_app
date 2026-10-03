class RoomsController < ApplicationController
  def index
    @rooms = Room.all

    if params[:area].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:area]}%")
    end
    if params[:keyword].present?
      @rooms = @rooms.where(
        "name LIKE ? OR description LIKE ?",
        "%#{params[:keyword]}%",
        "%#{params[:keyword]}%"
        )
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
   @room = Room.new
  end

  def create
   @room = current_user.rooms.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   @room = Room.find(params[:id])
  end

  def update
   @room = Room.find(params[:id])

   if @room.update(room_params)
    redirect_to @room, notice: "更新しました"
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path, notice: "削除しました", status: :see_other
  end

  def own
    @rooms = current_user.rooms
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
