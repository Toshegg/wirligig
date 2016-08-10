class City < ActiveRecord::Base
  belongs_to :country 
  has_many :universities

  validates_presence_of :name
end
