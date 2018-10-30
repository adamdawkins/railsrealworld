class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have logged in successfully'
      redirect_to root_path
    else
      flash[:alert] = "We couldn't find a user with that email / password"
      render :new
    end
  end
end
