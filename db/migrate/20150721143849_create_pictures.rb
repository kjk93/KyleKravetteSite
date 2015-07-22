class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.text :description
      t.integer :order
      t.references :folder, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pictures, [:folder_id, :order]
  end
end
