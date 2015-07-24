class Thumbnail < ActiveRecord::Base
  belongs_to :picture
  mount_uploader :pic, ThumbnailsUploader
  validates :pic, presence: true
  validates :title, presence: true
end