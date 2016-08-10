class LanguageCode < ActiveRecord::Base
  has_many :infos

  validates_presence_of :name
end

