class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to root_path(@user)
    else
      flash.now[:notice] = 'Please enter your name'
      render 'new'
    end
  end
end
