class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :pictures
  belongs_to :background_picture, class_name: "Picture"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  validates_uniqueness_of :username

  def get_color_scheme
    color_scheme
  end

  def get_fonts_choice
    fonts_choice
  end
end
