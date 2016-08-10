json.(info, :name, :web_site, :foreign_students, :admission_from, :admission_to, :pass_exams_from, :pass_exams_to, :note, :provides_dormitory, :show_name, :language_code_id)

json.courses_attributes do
  json.array! info.courses, partial: 'api/shared/course', as: :course
end

json.infos_study_languages_attributes do
  json.array! info.infos_study_languages, partial: 'api/shared/infos_study_language', as: :infos_study_language
end
