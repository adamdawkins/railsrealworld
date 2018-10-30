require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /sessions/new' do
    it 'returns the new session template' do
      get :new

      assert_template 'sessions/new'
    end
  end

  describe 'POST create' do
    describe "with valid params" do
      it "should authenticate user and redirect to root_path" do
        user = User.create(email: 'some@email.com', password: 'secret')
        allow(User).to receive(:find_by).with(email: "some@email.com").and_return(user)
        allow(user).to receive(:authenticate).and_return(true)

        post :create, params: { email: "some@email.com", password: "secret" }

        expect(session[:user_id]).to eql user.id
        expect(flash[:notice]).to_not be_nil
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "should not authenticate if user not exists" do
        allow(User).to receive(:find_by).and_return(nil)

        post :create, params: { email: "some@email.com", password: "secret" }
        expect(assigns(:user)).to be_nil
      end

      it "should not authenticate if given password invalid" do
        user = User.create(email: 'some@email.com', password: 'secret')
        allow(User).to receive(:find_by).with(email: "some@email.com").and_return(user)
        allow(user).to receive(:authenticate).and_return(false)

        post :create, params: { email: "some@email.com", password: "not_sceret" }

        expect(session[:user_id]).to be_nil
      end

      after(:each) do
        expect(flash[:alert]).to_not be_nil
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE destroy" do
    let (:user) { FactoryBot.create(:user) }
    before do
      session[:user_id] = user.id
    end

    it "clears the session user id" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the login page" do
      delete :destroy

      expect(response).to redirect_to(login_path)
    end

    it "sets the flash" do
      delete :destroy

      expect(flash[:notice]).to_not be_nil
    end
  end
end
