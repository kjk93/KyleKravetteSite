class CreateSlideslots < ActiveRecord::Migration
  def change
    create_table :slideslots do |t|
      t.string :picture
      t.references :slideshow, index: true, foreign_key: true
      t.integer :number

      t.timestamps null: false
    end
  end
end
