class Api::StudyLanguagesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin, only: [:update, :destroy, :create]

  def index
    @study_languages = StudyLanguage.all

    respond_with @study_languages
  end

  def create
    @study_language = StudyLanguage.create(permitted_params)

    respond_with @study_language 
  end

  def update
    @study_language.update(permitted_params)

    respond_with @study_language 
  end

  def destroy
    if @study_language.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @study_language
    end
  end

  private

  def set_model
    @study_language = StudyLanguage.find(params[:id])
  end

  def permitted_params
    params.require(:study_language).permit(:name)
  end


end
