class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_counter

  private
  
  def update_counter
    post.increment!(:like_counter)
  end
end
