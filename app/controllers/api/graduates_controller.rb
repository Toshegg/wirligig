class Api::GraduatesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @graduates = Graduate.all

    respond_with @graduates
  end

  def create
    @graduate = Graduate.create(permitted_params)

    respond_with @graduate 
  end

  def update
    @graduate.update(permitted_params)

    respond_with @graduate 
  end

  def destroy
    if @graduate.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @graduate
    end
  end

  private

  def set_model
    @graduate = Graduate.find(params[:id])
  end

  def permitted_params
    params.require(:graduate).permit(:name)
  end


end
