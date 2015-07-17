class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :name
      t.String :email
      t.String :password
      t.String :password_confirmation
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
