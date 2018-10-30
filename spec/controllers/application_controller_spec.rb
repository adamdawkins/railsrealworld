require 'rails_helper'

RSpec.describe ApplicationController do
  controller do
    before_action :authorize
    def index
      @current_user = current_user

      render plain: 'success'
    end
  end
  describe "#current_user" do
    describe "with logged in user" do
      let (:user) { double('User') }
      before do
        session[:user_id] = 1
        allow(User).to receive(:find).and_return(user)
      end
      it "sets @current_user to the user" do
        subject.current_user()
        expect(assigns(:current_user)).to eq user
      end
      it "return the user" do
        expect(subject.current_user()).to eq user
      end
    end

    describe "without logged in user" do
      it "does not return a user" do
        expect(subject.current_user()).to be_nil
      end
    end
  end

  describe "#authorize" do
    describe "with current_user" do
      before do
        allow(subject).to receive(:current_user).and_return(double('User'))
      end

      it "does not redirect to the login page" do
        get :index
        expect(response.body).to include 'success'
      end
    end
    describe "without current_user" do
      before do 
        allow(subject).to receive(:current_user).and_return(nil)
      end
      it "redirects to the login page" do
        get :index

        expect(response).to redirect_to login_path
      end
    end
  end
end
