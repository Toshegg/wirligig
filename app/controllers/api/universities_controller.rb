class Api::UniversitiesController < ApplicationController
  before_filter :set_model, only: [:show, :update, :destroy]
  before_action :check_if_admin_or_partner, only: [:update, :destroy, :create]
  before_action :check_if_creator, only: [:update, :destroy]
  before_action :check_if_paid, only: [:show]

  def index
    @universities = University.filtered_by(filter_params)

    respond_with @universities
  end

  def show
    respond_with @university 
  end

  def create
    @university = University.create(permitted_params.merge(creator: current_user))

    respond_with @university 
  end

  def update
    @university.update(permitted_params)

    respond_with @university 
  end

  def destroy
    if @university.destroy
      render json: {}, status: 204, layout: false
    else
      respond_with @university
    end
  end

  private

  def set_model
    @university = University.find(params[:id])
  end

  def check_if_creator 
    head 403 if @university.creator != current_user || !current_user.is_admin
  end

  def permitted_params
    pars = params.require(:university)
    if pars[:infos].present?
      pars[:infos_attributes] = pars.delete(:infos)

      pars[:infos_attributes].each.with_index do |info, index| 
        if info[:infos_study_languages].present?
          pars[:infos_attributes][index][:infos_study_languages_attributes] = pars[:infos_attributes][index][:infos_study_languages]
        end
        if info[:courses].present?
          pars[:infos_attributes][index][:courses_attributes] = pars[:infos_attributes][index][:courses]

          info[:courses_attributes].each.with_index do |course, index1|
            if course[:courses_exams].present?
              pars[:infos_attributes][index][:courses_attributes][index1][:courses_exams_attributes] = pars[:infos_attributes][index][:courses_attributes][index1][:courses_exams]
            end
            
            if course[:courses_graduates].present?
              pars[:infos_attributes][index][:courses_attributes][index1][:courses_graduates_attributes] = pars[:infos_attributes][index][:courses_attributes][index1][:courses_graduates]
            end

          end
        end
      end
    end
    pars.permit(:country_id, :city_id, :rating,  :foreign_students, :admission_from, :admission_to, :pass_exams_from, :pass_exams_to, :provides_dormitory, :show_name, infos_attributes: [:id, :name, :web_site,
                                                                                     :note, :language_code_id, infos_study_languages_attributes: [ :id, :study_language_id ],
                                                                                     courses_attributes: [:id, :name, :price, 
                                                                                                          courses_exams_attributes: [:id, :exam_id ],
                                                                                                          courses_graduates_attributes: [:id, :graduate_id ]

                                                                                      ]
                                                                              ]
                                      )
  end

  def filter_params
    params.permit(:country_id, :city_id, :course_id, :name)
  end
end
