class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.where('event_date >= ?', Time.zone.now)
    @prev_events = @user.attended_events.where('event_date < ?', Time.zone.now)
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      flash[:notice] = 'Sign Up Successfully'
      redirect_to new_session_path
    else
      flash[:notice] = "Name can't be blank"
      render :new
    end
end

  private

  def user_params
    params.require(:user).permit(:name)
end
end
