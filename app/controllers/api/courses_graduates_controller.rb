class Api::CoursesGraduatesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]

  def create
    @courses_graduate = CoursesGraduate.create(permitted_params)

    respond_with @courses_graduate 
  end

  def update
    @courses_graduate.update(permitted_params)

    respond_with @courses_graduate 
  end

  def destroy
    if @courses_graduate.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @courses_graduate
    end
  end

  private

  def set_model
    @courses_graduate = CoursesGraduate.find(params[:id])
  end

  def permitted_params
    params.require(:courses_graduate).permit(:course_id, :graduate_id)
  end

end
