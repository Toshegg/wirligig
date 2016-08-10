json.(course, :id, :name, :price, :info_id)

json.courses_exams do
  json.array! course.courses_exams, partial: 'api/courses_exams/model', as: :courses_exam
end
json.courses_graduates do
  json.array! course.courses_graduates, partial: 'api/courses_graduates/model', as: :courses_graduate
end
