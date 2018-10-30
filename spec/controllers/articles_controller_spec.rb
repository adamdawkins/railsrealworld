require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it "returns status ok" do
      get :index
      expect(response.status).to be 200
      assert_template 'articles/index'
    end

    # TODO: Why isn't this working?
    # it "returns all @articles" do
    #   get :index
    #   expect(assigns(:articles)).to exist
    # end
  end

  describe "GET #new" do
    describe "without logged in user" do
      it "redirects to the login page" do 
        get :new
        expect(response).to redirect_to login_path
      end
    end

    describe "with logged in user" do 
      before do
        allow(subject).to receive(:authorize).and_return true
      end

      it "renders the new article form" do
        get :new

        assert_template "articles/new"
      end

      it "assingns @article to a new article" do
        get :new
        expect(assigns(:article)).to be_an Article
      end
    end
  end

  describe "POST #create" do
    describe "without logged in user" do
      it "redirects to the login page" do 
        post :create
        expect(response).to redirect_to login_path
      end
    end
    describe "with logged in user" do
      let (:user) { User.create(email: 'adam@dragondrop.uk', password: 'password', username: 'username') }

      before do
        allow(subject).to receive(:authorize).and_return true
        allow(subject).to receive(:current_user).and_return(user)

      end
      describe "with valid params" do
        let (:params) { { title: "This is the title", body: "The body", description: "description" } }
        it "creates an article" do
          expect do
            post :create, params: { article: params }
          end.to change(Article, 'count').from(0).to(1)
        end

        it "redirects to the article" do
          post :create, params: { article: params }

          expect(response).to redirect_to article_path(assigns(:article))
        end
      end

      describe "with invalid params" do
      end
    end
  end

  describe "GET #show" do
    let (:article) { double("Article") }
    before :each do
      allow(Article).to receive_message_chain(:friendly, :find).and_return(article)
    end

    it "assigns @article" do
      get :show, params: { id: 1 }
      expect(assigns(:article)).to eql(article)
    end

    it "returns the article/show template" do
      get :show, params: { id: 1 }

      assert_template "articles/show"
    end
  end

  describe "GET #edit" do
    describe "without logged in user" do
      it "redirects to the login page" do
        get :edit, params: { id: 1 } 

        expect(response).to redirect_to login_path
      end
    end
    describe "as a different user to the author" do
    end

    describe "as the author" do 
      let (:article) { double("Article", slug: "the-wealth-of-nations") }
      before :each do
        allow(Article).to receive_message_chain(:friendly, :find).and_return(article)
        allow(subject).to receive(:authorize).and_return true
      end

      it "renders the new article form" do
        get :edit, params: { id: article.slug }

        assert_template "articles/edit"
      end

      it "assigns @article to the article" do
        get :edit, params: { id: article.slug }
        expect(assigns(:article)).to be article
      end
    end
  end

  describe "PATCH #update" do
    describe "without logged in user" do
      it "redirects to the login page" do
        patch :update, params: { id: 1, article: { title: 'A new title' } }

        expect(response).to redirect_to login_path
      end
    end
    describe "as a different user to the author" do
    end

    describe "as the author" do 
      let (:article) { FactoryBot.create(:article) }
      before :each do
        allow(subject).to receive(:authorize).and_return true
      end

      it "redirects to the show template" do
        patch :update, params: { id: article.id, article: { title: 'A new title' } }

        expect(response).to redirect_to article_path(article)
      end
      
      it "sets the flash" do
        patch :update, params: { id: article.id, article: { title: 'A new title' } }

        expect(flash[:notice]).to_not be_nil
      end
    end
  end

end
