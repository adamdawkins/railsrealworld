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
end
