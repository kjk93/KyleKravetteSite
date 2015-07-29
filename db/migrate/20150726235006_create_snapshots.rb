class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :title
      t.string :image
      t.references :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
