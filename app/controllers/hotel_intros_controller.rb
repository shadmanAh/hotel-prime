class HotelIntrosController < ApplicationController
  before_action :set_hotel_intro, only: %i[ show edit update destroy ]

  # GET /hotel_intros or /hotel_intros.json
  def index
    @hotel_intros = HotelIntro.all
  end

  # GET /hotel_intros/1 or /hotel_intros/1.json
  def show
  end

  # GET /hotel_intros/new
  def new
    @hotel_intro = HotelIntro.new
  end

  # GET /hotel_intros/1/edit
  def edit
  end

  # POST /hotel_intros or /hotel_intros.json
  def create
    @hotel_intro = HotelIntro.new(hotel_intro_params)

    respond_to do |format|
      if @hotel_intro.save
        format.html { redirect_to hotel_intro_url(@hotel_intro), notice: "Hotel intro was successfully created." }
        format.json { render :show, status: :created, location: @hotel_intro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel_intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_intros/1 or /hotel_intros/1.json
  def update
    respond_to do |format|
      if @hotel_intro.update(hotel_intro_params)
        format.html { redirect_to hotel_intro_url(@hotel_intro), notice: "Hotel intro was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel_intro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel_intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_intros/1 or /hotel_intros/1.json
  def destroy
    @hotel_intro.destroy

    respond_to do |format|
      format.html { redirect_to hotel_intros_url, notice: "Hotel intro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_intro
      @hotel_intro = HotelIntro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_intro_params
      params.require(:hotel_intro).permit(:title, :description, :avatar)
    end
end
