require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns an ok response" do
      get :new
      expect(response.status).to be 200
      assert_template 'users/new'
    end

    it "returns a new user for @user" do 
      get :new
      expect(assigns(:user).class.name).to eq 'User'
    end
  end

  describe "POST #create" do
    let (:params) { { username: 'username', email: 'email@example.com', password: 'password' } }

    it "saves the user" do
      expect do
        post :create, :params => { user: params }
      end.to change(User, 'count').from(0).to(1)
    end
    
    context "when the user is saved successfully" do 
      it "redirects to the user profile page" do
        post :create, :params => { user: params }
        user = assigns(:user)
        expect(response).to redirect_to(user_path(user))
      end
    end
  end
end
