class Api::CountriesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @countries = Country.all

    respond_with @countries
  end

  def create
    @country = Country.create(permitted_params)

    respond_with @country 
  end

  def update
    @country.update(permitted_params)

    respond_with @country 
  end

  def destroy
    if @country.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @country
    end
  end

  private

  def set_model
    @country = Country.find(params[:id])
  end

  def permitted_params
    params.require(:country).permit(:name)
  end

end
