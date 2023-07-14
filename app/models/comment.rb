class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
end

after_save :update_counter

private

def update_counter
  post.increment!(:comments_counter)
end
