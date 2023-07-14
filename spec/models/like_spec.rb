require 'rails_helper'

RSpec.describe Like, type: :model do
  it '#update_counter' do
    author = User.create!(name: 'test', post_counter: 0)
    post = Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: author)
    Like.create!(post: post, author: author)
    expect(post.likes_counter).to eq(2)
  end
end
