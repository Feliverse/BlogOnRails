require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('index of users')
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('show user')
    end
  end
end
