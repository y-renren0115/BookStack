class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :title, presence: true
  validates :contents, presence: true, length: {maximum: 200}
  
  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  # 検索機能メソッド
  def self.seeks(word, search)
    if search == "1"
      @book = Book.where("title like?", "#{word}")
    elsif search == "2"
      @book = Book.where("title like?", "#{word}%")
    elsif search == "3"
      @book = Book.where("title like?", "%#{word}")
    elsif search == "4"
      @book = Book.where("title like?", "%#{word}%")
    else
      @book = Book.all
    end
  end
end
