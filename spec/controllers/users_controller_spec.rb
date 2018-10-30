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

  describe 'get #show' do
    let (:user) { FactoryBot.create(:user) }

    before do
      allow(User).to receive_message_chain(:friendly, :find).and_return(user)
    end

    it "returns the show template" do
      get :show, params: { id: user }
      assert_template 'users/show'
    end

    it "assigns the user" do 
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "assigns articles to the user's authored articles" do
      get :show, params: { id: user }

      expect(assigns(:articles)).to eq user.articles
    end

    describe "when favourites=true query param is passed" do
      it "assigns @articles to the favourites" do
      get :show, params: { id: user, favourites: true }
      expect(assigns(:articles)).to eq user.favourite_articles
      end
    end
  end

  describe "POST #create" do
    let (:params) { { username: 'username', email: 'email@example.com', password: 'password' } }

    it "saves the user" do
      expect do
        post :create, params: { user: params }
      end.to change(User, 'count').from(0).to(1)
    end

    context "when the user is saved successfully" do
      it "redirects to the user profile page" do
        post :create, params: { user: params }
        user = assigns(:user)
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "when there is an error" do
      before do
        allow_any_instance_of(User).to receive(:save).and_return false
      end
      it "re-renders the new page" do
        post :create, params: { user: params }
        assert_template 'users/new'
      end
    end
  end
end
