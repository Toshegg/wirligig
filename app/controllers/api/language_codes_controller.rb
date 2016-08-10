class Api::LanguageCodesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @language_codes = LanguageCode.all

    respond_with @language_codes
  end

  def create
    @language_code = LanguageCode.create(permitted_params)

    respond_with @language_code 
  end

  def update
    @language_code.update(permitted_params)

    respond_with @language_code 
  end

  def destroy
    if @language_code.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @language_code
    end
  end

  private

  def set_model
    @language_code = LanguageCode.find(params[:id])
  end

  def permitted_params
    params.require(:language_code).permit(:name)
  end


end
