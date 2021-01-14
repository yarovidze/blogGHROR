class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :author_id, presence: true
  belongs_to :author, optional: true
  validates :title, presence: true, length: {maximum: 40}
  validates :content, presence: true, length: {maximum: 240}
  validates :image, presence: true
end
