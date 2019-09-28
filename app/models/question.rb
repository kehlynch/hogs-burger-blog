class Question < ApplicationRecord
  has_many :question_comments, dependent: :destroy
  has_one :question_answer, dependent: :destroy
  validates :body, presence: true

  def self.search(search)
    if search and search != ""
      Question.where('body like ?', "%#{search}%")
    else
      Question.all
    end
  end
end
