class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :pictures, dependent: :destroy
	default_scope {order(title: :asc)}
	validates :title, presence: true, allow_blank: false
end
