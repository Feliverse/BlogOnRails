require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'User index page' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'I am a user')
      visit users_path
    end

	  it 'shows the username of all other users' do
      User.all.each do |user|
        expect(page).to have_content('John')
      end
    end
    it 'shows the profile picture for each user' do
      User.all.each do |user|
        expect(page).to have_css('img')
      end
    end
    it 'shows the number of posts each user has written' do
      User.all.each do |user|
        expect(page).to have_content('Number of posts: 0')
      end
    end
    it 'Redirected to the user show page when clicking on the username' do
      User.all.each do |user|
        click_link('John')
        expect(page).to have_current_path(user_path(user.id))
      end
    end
  end

  describe 'User show page' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'I am a user', post_counter: 3)
      @first_post = Post.create(title: 'First', text: 'First post', comments_counter: 1, likes_counter: 1, author: @user)
      @second_post = Post.create(title: 'Second', text: 'Second post', comments_counter: 1, likes_counter: 1, author: @user)
      @third_post = Post.create(title: 'Third', text: 'Third post', comments_counter: 1, likes_counter: 1, author: @user)
      visit user_path(id: @user.id)
    end

    it "shows the user's profile picture" do
      expect(page).to have_css('img')
    end

    it "shows the user's username" do
      expect(page).to have_content('John')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content(@user.post_counter)
    end

    it "shows the user's bio" do
      expect(page).to have_content('I am a user')
    end

    it "should render the user's first 3 posts" do
      expect(page).to have_content('First')
      expect(page).to have_content('Second')
      expect(page).to have_content('Third')
    end

    it "should have a button to see all the user's posts" do
      expect(page).to have_link('See all posts')
    end

    it "should redirect to that post's show page" do
      click_link @first_post.title
      expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @first_post.id))
    end

    it "Redirected to the user's posts page when clicking on the 'See all posts' button" do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(user_id: @user.id))
    end
  end
end