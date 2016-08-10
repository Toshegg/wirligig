json.study_languages do
  json.array! @study_languages, partial: 'api/study_languages/model', as: :study_language
end

