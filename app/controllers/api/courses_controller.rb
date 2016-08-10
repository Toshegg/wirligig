class Api::CoursesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]

  def index
    @courses = Course.all

    respond_with @course
  end

  def create
    @course = Course.create(permitted_params)

    respond_with @course 
  end

  def update
    @course.update(permitted_params)

    respond_with @course 
  end

  def destroy
    if @course.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @course
    end
  end

  private

  def set_model
    @course = Course.find(params[:id])
  end

  def permitted_params
    params.require(:course).permit(:name, :price, :info_id)
  end


end
