class ArticlesController < ApplicationController
  before_action :authorize, only: [:create, :new, :edit, :update]
  before_action :verify_authorship, only: [:edit]

  def index
    @articles = Article.page(params[:page]).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article
    end
  end

  def show
    set_article
  end

  def edit
    set_article
  end

  def update
    article = Article.friendly.find(params[:id])
    article.update!(article_params)

    flash[:notice] = 'Article updated'
    redirect_to article
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :description)
    end

    def verify_authorship
      article = Article.friendly.find(params[:id])
      redirect_to article unless current_user && current_user.id == article.author.id
    end
end
