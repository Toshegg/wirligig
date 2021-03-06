class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entity, polymorphic: true

  validates_presence_of :user, :entity, :message
end
