class Slideshow < ActiveRecord::Base
  belongs_to :user
  has_many :slideslots
end
