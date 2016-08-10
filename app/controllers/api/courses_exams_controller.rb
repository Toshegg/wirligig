class Api::CoursesExamsController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]

  def create
    @courses_exam = CoursesExam.create(permitted_params)

    respond_with @courses_exam 
  end

  def update
    @courses_exam.update(permitted_params)

    respond_with @courses_exam 
  end

  def destroy
    if @courses_exam.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @courses_exam
    end
  end

  private

  def set_model
    @courses_exam = CoursesExam.find(params[:id])
  end

  def permitted_params
    params.require(:courses_exam).permit(:course_id, :exam_id)
  end

end
