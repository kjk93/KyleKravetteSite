class Slideslot < ActiveRecord::Base
  belongs_to :user
  validates :number, presence: true, uniqueness: {scope: :user, message: "Number already taken"}

  def prevSlot
  	user = self.user
  	slots = user.slideslots
  	n = self.number
  	slots.fetch(n-2).id
  end

  def nextSlot
  	user = self.user
  	slots = user.slideslots
  	n = self.number
  	if n == 5
  		slots.first.id
  	else
  		slots.fetch(n).id
  	end
  end

  def reset
    update_attributes(picture: nil, picture_id: nil, caption: nil)
  end
end
