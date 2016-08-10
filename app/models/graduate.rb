class Graduate < ActiveRecord::Base
  has_many :courses_graduates, dependent: :destroy
  has_many :infos, through: :courses_graduates
  
  validates_presence_of :name
end
