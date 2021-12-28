class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @ransack_rooms = Room.ransack(params[:rooms_search], search_key: :rooms_search)
    # @rooms = @ransack_rooms.result.includes(:user)
    @pagy, @rooms = pagy(@ransack_rooms.result.includes(:user))
  end

  def show
    @enrollment = Enrollment.all
  end

  def new
    @room = Room.new
    authorize @room
  end

  def edit
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    authorize @room
    @room.user = current_user
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @room
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @room
    @room.destroy
    
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end

    
  end

  private

    def set_room
      @room = Room.friendly.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:title, :description, :short_description, :size, :view, :bed, :price, :opacity, :avatar)
    end
end
