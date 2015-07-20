class Folder < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, allow_blank: false
end
