class FavouritesController < ApplicationController
  before_action :authorize, only: [:create]

  def create
    article = Article.friendly.find(params[:article_id])
    favour = Favouriting.new(article: article, user: current_user)
    favour.save
    flash[:notice] = "Article favourited"

    redirect_to article
  end
end
