class ChangeBackgroundPictureToId < ActiveRecord::Migration
  def change
    rename_column :users, :background_picture, :background_picture_id
    change_column :users, :background_picture_id, :integer
  end
end
