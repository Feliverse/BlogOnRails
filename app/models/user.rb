class User < ApplicationRecord
  attribute :post_counter, default: 0

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_3_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end
end
