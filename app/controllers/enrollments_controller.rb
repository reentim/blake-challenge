class EnrollmentsController < ApplicationController
  def update
    enrollment = Enrollment.find(params[:id])

    if enrollment.update(enrollment_params)
      render json: enrollment, status: :ok
    else
      render json: { errors: enrollment.errors }, status: :unproccessable_entity
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(
      :parts_completed,
    )
  end
end
