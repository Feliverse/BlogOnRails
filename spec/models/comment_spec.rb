require 'rails_helper'

RSpec.describe Comment, type: :model do
  it '#update_counter' do
    author = User.create!(name: 'test', post_counter: 0)
    post = Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: author)
    Comment.create!(post: post, author: author)
    expect(post.comments_counter).to eq(2)
  end
end
