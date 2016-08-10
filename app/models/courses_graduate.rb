class CoursesGraduate < ActiveRecord::Base
  belongs_to :course
  belongs_to :graduate
end
