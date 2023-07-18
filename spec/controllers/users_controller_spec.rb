require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      # Assuming you have a user with id 1, change the following line accordingly
      user = User.create(name: "John Doe")

      get :show, params: { id: 1 }
      expect(response).to render_template(:show)
    end
  end
end