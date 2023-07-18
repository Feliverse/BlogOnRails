require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:user_id/post" do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Index of posts')
    end

    describe "GET /users/id/posts/id" do
      it "returns http success" do
        get "/users/:user_id/posts/:post_id/"
        expect(response).to have_http_status(:success)
        expect(response.body).to include('show post')
      end
    end
  end
end