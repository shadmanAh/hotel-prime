class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]

  def index
    # @enrollments = Enrollment.all
    # @pagy, @enrollments = pagy(Enrollment.all)

    @q = Enrollment.ransack(params[:q])
    @pagy, @enrollments = pagy(@q.result.includes(:user))

    authorize @enrollments
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
    authorize @enrollment
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user = current_user
  
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully created." }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize @enrollment
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully updated." }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @enrollment
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: "Enrollment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_enrollment
      @enrollment = Enrollment.friendly.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:room_id, :rating, :review)
    end
end
