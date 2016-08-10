class Photo < ActiveRecord::Base
  belongs_to :university
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :image, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    size: { in: 0..10.megabytes }

  scope :avatars, -> {
    where(category: "Avatar")
  }

  scope :filtered_by, -> (filter_params) {
    res = all

    if filter_params[:university_id].present?
      university_id = filter_params.delete(:university_id)
      
      res = res.where(university_id: university_id)
    end

    res
  }

end
