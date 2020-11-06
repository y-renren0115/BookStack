class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :books
  attachment :profile_image, destroy: false
  validates :nickname, presence: true, length: {maximum: 6, minimum: 2}
  validates :introduces, length: {maximum: 50}
end
