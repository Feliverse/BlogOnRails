class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_counter

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    author.increment!(:post_counter)
  end
end
