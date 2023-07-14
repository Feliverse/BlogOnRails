class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, integer_only: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, integer_only: true } 
  
  after_save :update_counter

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    author.increment!(:post_counter)
  end
end
