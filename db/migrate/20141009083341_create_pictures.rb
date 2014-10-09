class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :user_id
      t.timestamps
    end
  end
end
