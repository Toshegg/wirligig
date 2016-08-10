class Api::PhotosController < ApplicationController

  def index
    @photos = Photo.filtered_by(filter_params)

    respond_with @photos
  end

  def create
    create_params = permitted_params
    create_params[:image] = create_params.delete(:file)
    @photo = Photo.create(create_params)

    respond_with @photo
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @photo
    end
  end

  private

  def filter_params
    params.permit(:university_id)
  end

  def permitted_params
    params.permit(:file, :category, :university_id)
  end
end
