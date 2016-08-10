class Api::ExamsController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @exams = Exam.all

    respond_with @exams
  end

  def create
    @exam = Exam.create(permitted_params)

    respond_with @exam 
  end

  def update
    @exam.update(permitted_params)

    respond_with @exam 
  end

  def destroy
    if @exam.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @exam
    end
  end

  private

  def set_model
    @exam = Exam.find(params[:id])
  end

  def permitted_params
    params.require(:exam).permit(:name)
  end


end
