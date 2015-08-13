class Display < ActiveRecord::Base
  belongs_to :picture
  mount_uploader :image, DisplaysUploader
end
