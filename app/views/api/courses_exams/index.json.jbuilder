json.courses_exams do
  json.array! @courses_exams, partial: 'api/courses_exams/model', as: :courses_exam
end

