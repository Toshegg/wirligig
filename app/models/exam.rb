class Exam < ActiveRecord::Base
  has_many :courses_exams, dependent: :destroy
  has_many :infos, through: :courses_exams
  
  validates_presence_of :name
end
