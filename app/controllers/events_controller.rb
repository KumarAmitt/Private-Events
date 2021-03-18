class EventsController < ApplicationController
  include EventsHelper

  def index
    @events = Event.all
    @user = current_user
    @upcoming = Event.upcoming
    @past = Event.past
    @event_option = @events.map { |e| [e.name, e.id] }
  end

  def new
    @event = Event.new
  end

  def show
    @all_attendees = User.all
  end

  def edit; end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'New event created'
      redirect_to root_path
    else
      flash.now[:notice] = "Name & Date can't be blank"
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date)
  end
end
