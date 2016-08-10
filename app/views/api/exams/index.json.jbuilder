json.exams do
  json.array! @exams, partial: 'api/exams/model', as: :exam
end

