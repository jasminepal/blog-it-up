class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs
  mount_uploader :avatar, AvatarUploader
  validates :gender, presence: true
  enum gender: { male: 0, female: 1, other: 2 }
  

  private 
end
