require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'Post index page' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'I am a user', post_counter: 1)
      @post = Post.create(title: 'First', text: 'First post', comments_counter: 2, likes_counter: 1, author: @user)
      @first_comment = Comment.create(text: 'First comment', author: @user, post: @post)
      Like.create(author: @user, post: @post)
      visit user_posts_path(user_id: @user.id)
    end

    it "shows user's profile picture" do
      expect(page).to have_css('img')
    end

    it "shows the user's username" do
      expect(page).to have_content(@post.author.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content(@post.author.post_counter)
    end

    it 'shows the post title' do
      expect(page).to have_content(@post.title)
    end

    it "shows the post's body" do
      expect(page).to have_content(@post.text)
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content('First comment')
    end

    it 'should render the number of comments' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'should render the number of likes' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'should render the pagenation button' do
      expect(page).to have_content('Pagination')
    end

    it "Redirects to the post's show page when the post's title is clicked" do
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @post.id))
    end
  end
end