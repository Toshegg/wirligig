class University < ActiveRecord::Base

  has_many :wishlists
  has_many :wished_users, through: :wishlists, source: :user
  has_many :comments, as: :entity

  belongs_to :city
  belongs_to :country
  belongs_to :creator, class_name: "User"

  has_many :infos, dependent: :destroy

  has_many :photos, dependent: :destroy
  has_many :avatars, -> { avatars }, class_name: "Photo"

  validates_presence_of :creator

  accepts_nested_attributes_for :infos

#  validates_presence_of :name, :city, :country
  #

  def name
    infos.where("name IS NOT NULL AND name != ''").first.try(:name) if infos.present?
  end

  def avatar
    avatars.first if avatars.present?
  end

  scope :filtered_by, -> (filter_params) {
    res = all

    if filter_params[:country_id].present?
      country_id = filter_params.delete(:country_id)

      res = res.where(country_id: country_id)
    end

    if filter_params[:city_id].present?
      city_id = filter_params.delete(:city_id)
      
      res = res.where(city_id: city_id)
    end

    if filter_params[:course_id].present?
      course_id = filter_params.delete(:course_id)

      res = res.joins(infos: [:courses]).where("courses.id = ?", course_id)
    end

    if filter_params[:name].present?
      name = filter_params.delete(:name)

      res = res.joins(:infos).where("infos.name ILIKE ?", "%#{name}%")
    end

    res
  }
end
