class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_counter
    post.increment!(:like_counter)
  end
end
