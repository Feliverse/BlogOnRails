require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      user = User.create(name: "John Doe", bio: "I am John Doe")
      post = Post.create(title: "Sample Post", author: user, likes_counter: 1, comments_counter: 1)
      get :index, params: { user_id: 1 }
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      # Assuming you have a user with id 1 and a post with id 1, change the following lines accordingly
      user = User.create(name: "John Doe")
      post = Post.create(title: "Sample Post", author: user, likes_counter: 1, comments_counter: 1)

      get :show, params: { user_id: 1, id: 1 }
      expect(response).to render_template(:show)
    end
  end
end