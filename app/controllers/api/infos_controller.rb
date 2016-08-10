class Api::InfosController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]

  def create
    @info = Info.create(permitted_params)

    respond_with @info 
  end

  def update
    @info.update(permitted_params)

    respond_with @info 
  end

  def destroy
    if @info.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @info
    end
  end

  private

  def set_model
    @info = Info.find(params[:id])
  end

  def permitted_params
    params.require(:info).permit(:name, :web_site, :foreign_students, :admission_from, :admission_to, :pass_exams_from, :pass_exams_to, :note, :provides_dormitory, :show_name, :language_code_id, :university_id)
  end

end
