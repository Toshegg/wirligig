class User < ActiveRecord::Base
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :comments
  has_many :wishlists
  has_many :wished_universities, through: :wishlists, source: :university
  has_many :universities, foreign_key: :creator_id

  has_one :payment

  before_create :generate_uuid

  def generate_uuid
    self.uuid = SecureRandom.hex
  end

  scope :filtered_by, -> (filter_params) {
    res = all

    if filter_params[:except_id].present?
      except_id = filter_params.delete(:except_id)
      
      res = res.where("id != ?", except_id)
    end

    res
  }
end
