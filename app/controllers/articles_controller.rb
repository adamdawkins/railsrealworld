class ArticlesController < ApplicationController
  before_action :authorize, only: [:create, :new]
  def index
    @articles = Article.all.limit(20)
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
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :description)
    end
end
