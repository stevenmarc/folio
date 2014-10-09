class Picture < ActiveRecord::Base
  mount_uploader :url, PictureUploader
  belongs_to :user
end
