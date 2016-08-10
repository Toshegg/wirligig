class Course < ActiveRecord::Base
  has_many :courses_exams, dependent: :destroy
  has_many :courses_graduates, dependent: :destroy

  has_many :exams, through: :courses_exams
  has_many :graduates, through: :courses_graduates

  belongs_to :info


  accepts_nested_attributes_for :courses_exams, :courses_graduates
end
