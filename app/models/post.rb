class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment_url, PostAttachmentUploader
end
