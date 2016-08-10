json.(info, :id, :name, :web_site, :note, :language_code_id)

json.courses do
  json.array! info.courses, partial: 'api/courses/model', as: :course
end

json.infos_study_languages do
  json.array! info.infos_study_languages, partial: 'api/shared/infos_study_language', as: :infos_study_language
end

json.study_languages do
  json.array! info.study_languages, partial: 'api/study_languages/model', as: :study_language
end
