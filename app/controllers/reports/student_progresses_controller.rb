module Reports
  class StudentProgressesController < ApplicationController
    def show
      @teacher = Teacher.find(params[:teacher_id])
    end
  end
end
