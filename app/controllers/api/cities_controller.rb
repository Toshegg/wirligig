class Api::CitiesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @cities = City.all

    respond_with @cities
  end

  def create
    @city = City.create(permitted_params)

    respond_with @city 
  end

  def update
    @city.update(permitted_params)

    respond_with @city 
  end

  def destroy
    if @city.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @city
    end
  end

  private

  def set_model
    @city = City.find(params[:id])
  end

  def permitted_params
    params.require(:city).permit(:name, :country_id, :living_cost, :cost_from, :cost_to)
  end

end
