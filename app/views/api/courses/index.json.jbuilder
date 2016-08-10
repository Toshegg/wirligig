json.courses do
  json.array! @courses, partial: 'api/courses/model', as: :course
end

