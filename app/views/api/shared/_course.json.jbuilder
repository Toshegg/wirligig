json.(course, :name, :price)

json.courses_exams_attributes do
  json.array! course.courses_exams, partial: 'api/shared/courses_exam', as: :courses_exam
end
json.courses_graduates_attributes do
  json.array! course.courses_graduates, partial: 'api/shared/courses_graduate', as: :courses_graduate
end
