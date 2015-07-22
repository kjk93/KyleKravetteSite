class Picture < ActiveRecord::Base
  belongs_to :folder
  default_scope -> {order(order: :desc)}
  mount_uploader :picture, PicturesUploader
  validates :picture, presence: true, allow_blank: false
  validates :order, presence: true
  validates :description, length: {maximum: 500}
  validate :picture_size

  private

  	def picture_size
  		if picture.size > 5.megabytes
  			errors.add(:picture, "should be less than 5MB")
  		end
  	end
end
