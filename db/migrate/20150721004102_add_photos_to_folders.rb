class AddPhotosToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :photos, :json
  end
end
