require 'rails_helper'

RSpec.describe FavouritesController, type: :controller do
  describe "POST /create" do
    describe "without logged in user" do
      it "redirects to the login page" do
        post :create, params: { article_id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "with user logged in" do
      let (:user) { FactoryBot.create(:user) }
      let (:article) { FactoryBot.create(:article) }

      before do
        allow(subject).to receive(:authorize).and_return(:true)
        allow(subject).to receive(:current_user).and_return(user)
        allow(Article).to receive_message_chain(:friendly, :find).and_return(article)
      end

      before :each do
        post :create, params: { article_id: article.id }
      end

      it "creates a Favouriting" do
        expect(Favouriting.first).to be_a Favouriting
      end

      it "sets a flash message" do
        expect(flash[:notice]).to_not be_nil
      end

      it "redirects to the article" do
        expect(response).to redirect_to(article_path(article))
      end

    end
  end
end
