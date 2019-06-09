class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 10 }
  validates :rating, presence: true
  validates :image, presence: true
  has_one_attached :image

  def self.search(search)
    if search and search != ""
      Post.where('text like ? or title like ?', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
end
