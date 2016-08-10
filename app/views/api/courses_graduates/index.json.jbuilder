json.courses_graduates do
  json.array! @courses_graduates, partial: 'api/courses_graduates/model', as: :courses_graduate
end

