class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :books
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # フォロー機能アソシエーション記述
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  #フォロー機能で参照するための記述
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  def follow(user)
    # self.relationships.create(followed_id: user)
    unless self == user
      self.relationships.find_or_create_by(followed_id: user)
    end
  end
  
  def unfollow(user)
    self.relationships.find_by(followed_id: user).destroy
  end
  
  def following?(user)
    self.followings.include?(user)
  end
                        
  attachment :user_image
  validates :nickname, presence: true, length: {maximum: 6, minimum: 2}
  validates :introduces, length: {maximum: 50}
end
