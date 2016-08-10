class Info < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :infos_study_languages, dependent: :destroy
  has_many :study_languages, through: :infos_study_languages
  
  belongs_to :language_code
  belongs_to :university

  accepts_nested_attributes_for :infos_study_languages, :courses
end
