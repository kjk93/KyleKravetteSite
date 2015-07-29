class Snapshot < ActiveRecord::Base
  belongs_to :picture
  mount_uploader :image, SnapshotsUploader
end
