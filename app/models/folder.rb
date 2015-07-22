class Folder < ActiveRecord::Base
	belongs_to :user
	default_scope {order(title: :desc)}
	validates :title, presence: true, allow_blank: false
end
