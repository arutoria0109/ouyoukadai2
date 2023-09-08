class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #中間テーブルの記載↑

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
# 検索方法分岐 (titleは検索対象であるbooksテーブル内のカラム名)

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{word}")#完全一致
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{word}%")#前方一致
    elsif search == "backward_match"
      @book = Book.where("title LIKE?", "%#{word}")#後方一致
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{word}%")#部分一致
    else
      @book =Book.all
    end
  end

end

