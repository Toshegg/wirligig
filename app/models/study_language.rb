class StudyLanguage < ActiveRecord::Base
  has_many :infos_study_languages, dependent: :destroy
  has_many :infos, through: :infos_study_languages
  
  validates_presence_of :name  
end
