class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :title, presence: true
  validates :contents, presence: true, length: {maximum: 200}
  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
