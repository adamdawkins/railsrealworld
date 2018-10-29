require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it "returns status ok" do
      get :index
      expect(response.status).to be(200)
    end

    it "returns all @articles" do
      get :index
      expect(Article.all).to eq assigns(:articles)
    end
  end
end
