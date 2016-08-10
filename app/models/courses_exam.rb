class CoursesExam < ActiveRecord::Base
  belongs_to :course
  belongs_to :exam
end
