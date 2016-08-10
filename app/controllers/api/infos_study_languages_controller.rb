class Api::InfosStudyLanguagesController < ApplicationController
  before_filter :set_model, only: [:update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]

  def create
    @infos_study_language = InfosStudyLanguage.create(permitted_params)

    respond_with @infos_study_language 
  end

  def update
    @infos_study_language.update(permitted_params)

    respond_with @infos_study_language 
  end

  def destroy
    if @infos_study_language.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @infos_study_language
    end
  end

  private

  def set_model
    @infos_study_language = InfosStudyLanguage.find(params[:id])
  end

  def permitted_params
    params.require(:infos_study_language).permit(:info_id, :study_language_id)
  end

end
