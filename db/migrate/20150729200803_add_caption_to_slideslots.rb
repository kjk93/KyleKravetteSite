class AddCaptionToSlideslots < ActiveRecord::Migration
  def change
  	add_column :slideslots, :caption, :string
  end
end
