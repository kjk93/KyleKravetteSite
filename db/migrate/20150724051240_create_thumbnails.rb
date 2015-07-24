class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :pic
      t.string :title
      t.references :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
