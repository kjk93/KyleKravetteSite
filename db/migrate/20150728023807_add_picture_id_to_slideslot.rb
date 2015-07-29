class AddPictureIdToSlideslot < ActiveRecord::Migration
  def change
  	add_column :slideslots, :picture_id, :integer, index: true
  end
end
