require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.new(name: 'John')

  describe 'Title' do
    it 'not valid if blank' do
      post = Post.new(title: nil, comments_counter: 1, likes_counter: 1, author: author)
      expect(post).to_not be_valid
    end

    it 'valid if not blank' do
      post = Post.new(title: 'test', comments_counter: 1, likes_counter: 1, author: author)
      expect(post).to be_valid
    end

    it 'not valid if exceeds 250 characters' do
      post = Post.new(title: 'a' * 251, comments_counter: 1, likes_counter: 1, author: author)
      expect(post).to_not be_valid
    end
  end

  describe 'LikesCounter' do
    it 'is not valid if it is not an integer greater than or equal to zero' do
      post = Post.new(title: 'test', comments_counter: 1, likes_counter: -1, author: author)
      expect(post).to_not be_valid
    end

    it 'is valid if it is an integer greater than or equal to zero' do
      post = Post.new(title: 'test', comments_counter: 1, likes_counter: 0, author: author)
      expect(post).to be_valid
    end
  end

  describe 'CommentsCounter' do
    it 'is not valid if it is not an integer greater than or equal to zero' do
      post = Post.new(title: 'test', comments_counter: -1, likes_counter: 1, author: author)
      expect(post).to_not be_valid
    end

    it 'is valid if it is an integer greater than or equal to zero' do
      post = Post.new(title: 'test', comments_counter: 0, likes_counter: 1, author: author)
      expect(post).to be_valid
    end
  end

  it '#last_5_comments' do
    user = User.create!(name: 'test', post_counter: 0)
    post = Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: user)
    Comment.create!(text: 'first comment', author: user, post: post)
    Comment.create!(text: 'second comment', author: user, post: post)
    Comment.create!(text: 'third comment', author: user, post: post)
    Comment.create!(text: 'fourth comment', author: user, post: post)
    Comment.create!(text: 'fifth comment', author: user, post: post)
    Comment.create!(text: 'sixth comment', author: user, post: post)
    comments = post.last_5_comments
    expect(comments.size).to eq(5)
  end

  it '#update_author_post_counter' do
    author = User.create!(name: 'test', post_counter: 0)
    Post.create!(title: 'first post', comments_counter: 1, likes_counter: 1, author: author)
    expect(author.post_counter).to eq(1)
  end
end
