class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :university

  validates_presence_of :user, :university
end
