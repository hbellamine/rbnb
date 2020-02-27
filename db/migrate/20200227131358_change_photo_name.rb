class ChangePhotoName < ActiveRecord::Migration[5.2]
  def change
    rename_column :puppies, :photo, :picture
  end
end
