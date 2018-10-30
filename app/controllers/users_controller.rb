class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.friendly.find(params[:id])
     @articles =
       if params[:favourites]
         @user.favourite_articles
       else
         @user.articles
       end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  protected
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
