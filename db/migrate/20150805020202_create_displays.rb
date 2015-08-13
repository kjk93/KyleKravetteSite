class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.string :image
      t.references :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
