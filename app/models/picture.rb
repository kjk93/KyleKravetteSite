class Picture < ActiveRecord::Base
  belongs_to :folder
  has_one :thumbnail
  default_scope {order(order: :asc)}
  mount_uploader :picture, PicturesUploader
  validates :picture, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :order, presence: true, uniqueness: {scope: :folder, message: "Folder Name Taken"}
  validates :description, length: {maximum: 500}
  validate :picture_size

  private

  	def picture_size
  		if picture.size > 5.megabytes
  			errors.add(:picture, "should be less than 5MB")
  		end
  	end
end
