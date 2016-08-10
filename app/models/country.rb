class Country < ActiveRecord::Base
  has_many :cities
  has_many :universities
  
  validates_presence_of :name
end
