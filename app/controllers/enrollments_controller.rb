class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update]

  def new
    @enrollment = Enrollment.new
  end

  def show
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      redirect_to @enrollment, notice: "Enrollment created"
    else
      render :edit
    end
  end

  def update
    @enrollment = Enrollment.find(params[:id])

    if @enrollment.update(enrollment_params)
      redirect_to @enrollment, notice: "Enrollment updated"
    else
      render :edit
    end
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(
      :student_id,
      :lesson_id,
      :class_group_id,
      :parts_completed,
    )
  end
end
